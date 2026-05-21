import Combine
import Foundation
import Security

#if canImport(Sparkle)
    import Sparkle
#endif

@MainActor
final class SparkleController: NSObject, ObservableObject {
    static let shared = SparkleController()

    @Published private(set) var isUpdateReady = false

    #if canImport(Sparkle)
        private var updaterController: SPUStandardUpdaterController?
    #endif

    private override init() {
        super.init()

        #if canImport(Sparkle)
            guard Self.canUseSparkle else {
                return
            }

            let controller = SPUStandardUpdaterController(
                startingUpdater: false,
                updaterDelegate: self,
                userDriverDelegate: nil
            )
            controller.startUpdater()
            updaterController = controller
        #endif
    }

    var canCheckForUpdates: Bool {
        #if canImport(Sparkle)
            updaterController != nil
        #else
            false
        #endif
    }

    func checkForUpdates() {
        #if canImport(Sparkle)
            updaterController?.checkForUpdates(nil)
        #endif
    }

    private static var canUseSparkle: Bool {
        let bundle = Bundle.main
        let bundleURL = bundle.bundleURL

        guard bundleURL.pathExtension == "app",
            bundle.object(forInfoDictionaryKey: "SUFeedURL") as? String != nil,
            bundle.object(forInfoDictionaryKey: "SUPublicEDKey") as? String != nil
        else {
            return false
        }

        return isDeveloperIDSigned(bundleURL: bundleURL)
    }

    private static func isDeveloperIDSigned(bundleURL: URL) -> Bool {
        var staticCode: SecStaticCode?
        guard SecStaticCodeCreateWithPath(bundleURL as CFURL, SecCSFlags(), &staticCode) == errSecSuccess,
            let code = staticCode
        else {
            return false
        }

        var infoCF: CFDictionary?
        guard
            SecCodeCopySigningInformation(code, SecCSFlags(rawValue: kSecCSSigningInformation), &infoCF)
                == errSecSuccess,
            let info = infoCF as? [String: Any],
            let certificates = info[kSecCodeInfoCertificates as String] as? [SecCertificate],
            let leaf = certificates.first
        else {
            return false
        }

        guard let summary = SecCertificateCopySubjectSummary(leaf) as String? else {
            return false
        }

        return summary.hasPrefix("Developer ID Application:")
    }
}

#if canImport(Sparkle)
    extension SparkleController: SPUUpdaterDelegate {
        nonisolated func updater(_: SPUUpdater, didDownloadUpdate _: SUAppcastItem) {
            Task { @MainActor in
                self.isUpdateReady = true
            }
        }

        nonisolated func updater(_: SPUUpdater, failedToDownloadUpdate _: SUAppcastItem, error _: Error) {
            Task { @MainActor in
                self.isUpdateReady = false
            }
        }

        nonisolated func userDidCancelDownload(_: SPUUpdater) {
            Task { @MainActor in
                self.isUpdateReady = false
            }
        }

        nonisolated func updater(
            _: SPUUpdater,
            userDidMake choice: SPUUserUpdateChoice,
            forUpdate _: SUAppcastItem,
            state: SPUUserUpdateState
        ) {
            let updateWasDownloaded = state.stage == .downloaded

            Task { @MainActor in
                switch choice {
                case .dismiss:
                    self.isUpdateReady = updateWasDownloaded
                case .install, .skip:
                    self.isUpdateReady = false
                @unknown default:
                    self.isUpdateReady = false
                }
            }
        }
    }
#endif

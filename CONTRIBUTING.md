# Contributing

Thanks for taking the time to improve PulseBar.

## Development Setup

You need macOS 13 Ventura or newer and the Swift 6 toolchain.

For manual testing, keep a local DGX Dashboard reachable at `http://127.0.0.1:11000` through either NVIDIA Sync or a manual SSH tunnel, then sign in with valid dashboard credentials.

Run from source:

```bash
swift build
swift run PulseBar
```

To run from Xcode, open `Package.swift` as a Swift package and run the `PulseBar` executable target.

## Local App Builds

Build a release `.app` bundle and copy it to `~/Applications`:

```bash
make install
```

The installed app is `~/Applications/PulseBar.app`. To remove it:

```bash
make uninstall
```

Build the release DMG locally:

```bash
make dmg
```

The generated disk image is written to `.build/release/artifacts/PulseBar-<version>.dmg`.

Local unsigned builds keep the updater disabled. Signed direct-download builds can check for app updates from the PulseBar menu.

## Checks

```bash
make format
make check
make readme-assets
```

`make check` runs the same gates used by CI:

- `swift format lint --strict` with the checked-in `.swift-format` configuration.
- `swift build -Xswiftc -warnings-as-errors`.
- `swift test -Xswiftc -warnings-as-errors`.

The GitHub Actions workflow at `.github/workflows/quality.yml` runs on pull requests, pushes to `main`, and manual dispatches.

## Telemetry Contract

The current implementation expects `gpu_telemetry` SSE events shaped like this:

```json
{
  "TelemetryForGPUs": [
    {
      "percentage_utilization": 37.0,
      "memory_total_in_mb": 65536,
      "memory_available_in_mb": 32768
    }
  ]
}
```

`percentage_utilization` drives the GPU figure. The menu bar `RAM` value is derived from the streamed `memory_total_in_mb` and `memory_available_in_mb` fields, so PulseBar reflects the dashboard payload rather than a separate macOS system probe.

## Project Notes

- Keep changes focused and consistent with the existing Swift package app structure.
- Do not commit local build artifacts from `.build/`.

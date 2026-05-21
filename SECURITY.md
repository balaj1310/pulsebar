# Security

PulseBar is local-first. It communicates with the local DGX Dashboard endpoint configured in the app, stores the dashboard username in `UserDefaults`, and stores the dashboard auth token in the macOS Keychain.

## Privacy

- Dashboard credentials are sent only to the local dashboard endpoint configured in the app.
- The auth token is stored as a generic password item in the macOS Keychain.
- No telemetry is sent to a third-party service by PulseBar.
- Diagnostics are kept as a short in-memory log and can be shown in the menu.

## Reporting A Vulnerability

If you believe you have found a security issue, avoid posting credentials, tokens, or sensitive dashboard details in public reports. Use GitHub private vulnerability reporting if it is enabled for this repository, or open an issue with sensitive details omitted.

# OHA iPhone/iPad source project

Minimal SwiftUI + WKWebView wrapper for https://oha.to/.

## Important
- This ZIP contains source code, not a signed/installable IPA.
- Xcode runs only on macOS. With Windows only, use a hosted macOS build runner such as GitHub Actions.
- The workflow below builds an unsigned IPA artifact; it must still be signed/installed with a sideloading tool.
- A free Apple ID typically requires refreshing/re-signing sideloaded apps about every 7 days.
- This wrapper uses iOS WebKit and cannot guarantee every OHA stream will play.
- Use the site only for content you are authorized to access.

## Windows-only build outline
1. Create a GitHub repository and upload the contents of this ZIP.
2. Open Actions and run “Build unsigned iOS IPA”.
3. Download the `OHA-unsigned-IPA` artifact from the completed workflow.
4. Use a trusted sideloading tool such as Sideloadly to sign/install it on your iPhone or iPad using your own Apple ID. Never share your Apple ID password in chat.

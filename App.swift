import SwiftUI
import WebKit

@main
struct OHAApp: App {
    var body: some Scene {
        WindowGroup { OHAWebView() }
    }
}

struct OHAWebView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        let web = WKWebView(frame: .zero, configuration: config)
        web.navigationDelegate = context.coordinator
        web.allowsBackForwardNavigationGestures = true
        web.load(URLRequest(url: URL(string: "https://oha.to/")!))
        context.coordinator.webView = web
        return web
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    final class Coordinator: NSObject, WKNavigationDelegate {
        weak var webView: WKWebView?
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) { showError(error, in: webView) }
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) { showError(error, in: webView) }
        private func showError(_ error: Error, in webView: WKWebView) {
            let msg = (error as NSError).localizedDescription
                .replacingOccurrences(of: "&", with: "&amp;")
                .replacingOccurrences(of: "<", with: "&lt;")
                .replacingOccurrences(of: ">", with: "&gt;")
            webView.loadHTMLString("""
            <html><meta name="viewport" content="width=device-width, initial-scale=1">
            <body style="font: -apple-system-body; padding: 24px">
            <h2>OHA ne peut pas être chargé</h2><p>\(msg)</p>
            <p>Vérifiez la connexion et réessayez.</p></body></html>
            """, baseURL: URL(string: "https://oha.to/"))
        }
    }
}

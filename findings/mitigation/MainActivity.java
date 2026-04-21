package com.example.mastg_test0019;

import android.os.Bundle;
import android.webkit.SslErrorHandler;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

/*
 * Mitigated example for Assignment 2 Part A.
 *
 * This removes the cleartext HTTP load and rejects TLS failures instead of
 * bypassing certificate validation.
 */
public class MainActivity extends AppCompatActivity {
    @Override
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (view, windowInsetsCompat) -> {
            Insets insets = windowInsetsCompat.getInsets(WindowInsetsCompat.Type.systemBars());
            view.setPadding(insets.left, insets.top, insets.right, insets.bottom);
            return windowInsetsCompat;
        });

        WebView webView = findViewById(R.id.webview);
        webView.getSettings().setJavaScriptEnabled(false);
        webView.setWebViewClient(new WebViewClient() {
            @Override
            public void onReceivedSslError(WebView view, SslErrorHandler handler, android.net.http.SslError error) {
                // Reject invalid certificates instead of allowing MITM traffic.
                handler.cancel();
            }
        });

        // Load only HTTPS content.
        webView.loadUrl("https://www.example.com");
    }
}

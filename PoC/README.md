# Proof of Concept: MITM Content Injection

This folder contains the proof-of-concept material for the insecure network transport finding in `a2_case1.apk`.

## Vulnerability Demonstrated

The APK package `com.example.mastg_test0019` loads `http://www.example.com` in an Android `WebView` while cleartext traffic is permitted. An on-path attacker can intercept the HTTP response and replace it with attacker-controlled HTML.

Relevant static evidence:

- `decompiled/resources/AndroidManifest.xml`: `android:usesCleartextTraffic="true"`
- `decompiled/sources/com/example/mastg_test0019/MainActivity.java`: `webView.loadUrl("http://www.example.com")`
- `decompiled/sources/com/example/mastg_test0019/MainActivity.java`: `onReceivedSslError(...)` calls `sslErrorHandler.proceed()`

## Files

- `poc_replace.py`: mitmproxy response hook that replaces responses for `example.com` with a visible POC page.
- `poc_mitm_content_injection.mov`: recorded demonstration of the POC.
- `SHA256SUMS.txt`: checksums for verifying the POC script and video.

## Environment Used

- macOS on Apple Silicon
- Android Emulator
- Android Debug Bridge (`adb`)
- mitmproxy / mitmdump

## Reproduction Steps

Install the APK:

```bash
cd /Users/healer/Downloads/Info5995-Assignment-2-main
adb install -r a2_case1.apk
```

Start mitmproxy with the replacement script:

```bash
cd /Users/healer/Downloads/Info5995-Assignment-2-main/PoC
mitmdump -p 8080 -s poc_replace.py
```

In a second terminal, configure the Android emulator to use the host proxy:

```bash
adb shell settings put global http_proxy 10.0.2.2:8080
```

Clear and launch the target app:

```bash
adb shell pm clear com.example.mastg_test0019
adb shell monkey -p com.example.mastg_test0019 -c android.intent.category.LAUNCHER 1
```

Expected evidence:

- `mitmdump` shows a cleartext request to `http://www.example.com/`.
- The app `WebView` displays `POC: MITM Content Injection`.

Clean up the emulator proxy after testing:

```bash
adb shell settings put global http_proxy :0
```

Optional integrity check:

```bash
cd /Users/healer/Downloads/Info5995-Assignment-2-main/PoC
shasum -a 256 -c SHA256SUMS.txt
```

## Demonstrated Impact

The video demonstrates that the app's cleartext HTTP `WebView` traffic can be intercepted and modified by an on-path proxy. This supports the report finding that the app is vulnerable to man-in-the-middle content injection.

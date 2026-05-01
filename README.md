# INFO5995 Assignment 2 Part A: AI-Assisted Network Security Analysis

This repository mirrors the Assignment 1 workflow, but for `a2_case1.apk` and the Part A network-security scope from Assignment 2.

## Assignment Scope

The provided specification and rubric state that Part A is graded only on the intended insecure network transport / TLS configuration issue that enables man-in-the-middle style attacks. This repository is therefore focused on that class only.

## Verified App Behavior

- The APK package is `com.example.mastg_test0019` (`MASTG-TEST0019`).
- The manifest enables cleartext traffic with `android:usesCleartextTraffic="true"`.
- `MainActivity` contains a `WebView` and loads `http://www.example.com`.
- The `WebViewClient` overrides `onReceivedSslError(...)` and calls `proceed()`, which suppresses certificate warnings.
- A `HostnameVerifier` implementation that always returns `true` is also present in `MainActivity`, although it is not wired to an active connection in the observed code path.

## Core Part A Finding

The shipped APK permits insecure network communication in multiple ways:

1. It explicitly allows cleartext HTTP in the manifest.
2. It actively loads an `http://` URL in the `WebView`.
3. It suppresses SSL certificate errors in `onReceivedSslError(...)`.

The cleartext `WebView` load is the primary demonstrated vulnerability. The SSL-error bypass is additional evidence of unsafe transport handling if the app were switched to HTTPS content.

## Important Evidence

- [decompiled/resources/AndroidManifest.xml](/home/adi2710/Downloads/Assignment2/decompiled/resources/AndroidManifest.xml:18)
- [decompiled/sources/com/example/mastg_test0019/MainActivity.java](/home/adi2710/Downloads/Assignment2/decompiled/sources/com/example/mastg_test0019/MainActivity.java:31)
- [apktool-out/smali/com/example/mastg_test0019/MainActivity$1.smali](/home/adi2710/Downloads/Assignment2/apktool-out/smali/com/example/mastg_test0019/MainActivity$1.smali:35)
- [apktool-out/smali/com/example/mastg_test0019/MainActivity$2.smali](/home/adi2710/Downloads/Assignment2/apktool-out/smali/com/example/mastg_test0019/MainActivity$2.smali:38)

## Deliverable Files

- `findings/report.tex`: USENIX-format Part A report source.
- `findings/report.pdf`: compiled Part A report.
- `findings/mitigation/`: example patched files showing how to disable cleartext traffic and reject TLS failures.
- `ai-log/ai-log.txt`: concise AI usage log and rubric-driven mock Q&A notes.
- `decompiled/` and `apktool-out/`: JADX and APKTool outputs used as evidence.

## Part B Coordination

A sanitized Part B coordination package has been added under `part-b/`.

The current main candidate is a Mattermost Jira plugin authorization issue affecting subscription-template configuration tied to private channels. Raw technical evidence is intentionally kept outside this public/team repository pending tutor/coordinator guidance and responsible disclosure handling.


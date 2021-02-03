// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';

// class WebViewWidget extends StatefulWidget {
//   final String initUrl;

//   WebViewWidget(this.initUrl);

//   @override
//   _WebViewWidgetState createState() => _WebViewWidgetState();
// }

// class _WebViewWidgetState extends State<WebViewWidget> {
//   Completer<WebViewController> _controller = Completer<WebViewController>();
//   InAppLocalhostServer localhostServer = new InAppLocalhostServer();

//   Future main() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     await localhostServer.start();
//   }

//   @override
//   Widget build(BuildContext context) {
//     WidgetsFlutterBinding.ensureInitialized();
//     localhostServer.start();
//     return Scaffold(
//       body: Container(
//           child: Column(children: <Widget>[
//             Expanded(
//               child: Container(
//                 child: InAppWebView(
//                   initialUrl: widget.initUrl,
//                   initialHeaders: {},
//                   initialOptions: InAppWebViewGroupOptions(
//                       inAppWebViewOptions: InAppWebViewOptions(
//                         debuggingEnabled: true,
//                       )
//                   ),
//                   onWebViewCreated: (InAppWebViewController controller) {

//                   },
//                   onLoadStart: (InAppWebViewController controller, String url) {

//                   },
//                   onLoadStop: (InAppWebViewController controller, String url) {

//                   },
//                 ),
//               ),
//             )]
//           )
//         ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onLoadStart(String url) async {
    print("\n\nStarted $url\n\n");
  }

  @override
  Future onLoadStop(String url) async {
    print("\n\nStopped $url\n\n");
  }

  @override
  void onLoadError(String url, int code, String message) {
    print("\n\nCan't load $url.. Error: $message\n\n");
  }

  @override
  void onExit() {
    print("\n\nBrowser closed!\n\n");
  }
}

class MyChromeSafariBrowser extends ChromeSafariBrowser {
  MyChromeSafariBrowser(browserFallback) : super(bFallback: browserFallback);

  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}
  
class WebViewWidget extends StatefulWidget {
  final String initUrl;
  WebViewWidget(this.initUrl);
  final ChromeSafariBrowser browser =
      new MyChromeSafariBrowser(new MyInAppBrowser());

  @override
  _WebViewWidgetState createState() => new _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  @override
  void initState() {
    WidgetsFlutterBinding.ensureInitialized(); 
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 1,
        label: 'Custom item menu 1',
        action: (url, title) {
          print('Custom item menu 1 clicked!');
          print(url);
          print(title);
        }));
    widget.browser.addMenuItem(new ChromeSafariBrowserMenuItem(
        id: 2,
        label: 'Custom item menu 2',
        action: (url, title) {
          print('Custom item menu 2 clicked!');
          print(url);
          print(title);
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ChromeSafariBrowser Example'),
        ),
        body: Center(
          child: RaisedButton(
              onPressed: () async {
                await widget.browser.open(
                    url: widget.initUrl,
                    options: ChromeSafariBrowserClassOptions(
                        android: AndroidChromeCustomTabsOptions(
                            addDefaultShareMenuItem: false),
                        ios: IOSSafariOptions(barCollapsingEnabled: true)));
              },
              child: Text("Open Chrome Safari Browser")),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  const WebViewExample({Key? key, required this.id}) : super(key: key);

  final String id;
  @override
  WebViewExampleState createState() => WebViewExampleState();
}

class WebViewExampleState extends State<WebViewExample> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();

    }
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: 'https://2embed.org/embed/${widget.id}',
      javascriptMode: JavascriptMode.unrestricted,
      navigationDelegate: (navigation) => NavigationDecision.prevent,
    );
  }
}




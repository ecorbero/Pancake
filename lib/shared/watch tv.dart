import 'package:flutter/material.dart';
import 'package:pancake/data_handeling/apiservices.dart';
import 'dart:io';

import 'package:webview_flutter/webview_flutter.dart';


class WebViewExampleTV extends StatefulWidget {
  const WebViewExampleTV({Key? key, required this.id, required this.season, required this.episode}) : super(key: key);

  final String id;
  final String season;
  final String episode;
  @override
  WebViewExampleTVState createState() => WebViewExampleTVState();
}

class WebViewExampleTVState extends State<WebViewExampleTV> {
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
    return FutureBuilder(
      future: ApiService().getTVimbdid(widget.id, widget.season, widget.episode),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return (snapshot.hasData) ? WebView(
          initialUrl: 'https://2embed.org/embed/${snapshot.data.id}',
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (navigation) => NavigationDecision.prevent,
        ) : const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}





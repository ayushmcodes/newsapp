import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class ArticleView extends StatefulWidget {
  final String url;
  ArticleView(this.url);
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  final Completer<WebViewController> _completer=Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("News",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight:FontWeight.w600
              ),),
            Text("App",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600
              ),)
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
      ) ,
      body: Container(
        child: WebView(
          initialUrl: widget.url,
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        )
      ),
    );
  }
}

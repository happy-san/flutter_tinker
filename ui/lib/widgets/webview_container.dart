import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewContainer extends StatefulWidget {
  final url;
  final Key key;
  final Color backgroundColor;
  WebViewContainer(this.url, {this.key, this.backgroundColor})
      : super(key: key);
  @override
  createState() => _WebViewContainerState(this.url);
}

class _WebViewContainerState extends State<WebViewContainer> {
  var _url;
  var _stackToView = 1;

  Completer<WebViewController> _controller = Completer<WebViewController>();

  _WebViewContainerState(this._url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? Colors.transparent,
      body: IndexedStack(
        index: _stackToView,
        children: <Widget>[
          new WebView(
            key: widget.key,
            initialUrl: _url,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (webViewCreate) {
              _controller.complete(webViewCreate);
            },
            onPageFinished: (finish) {
              setState(() {
                _stackToView = 0;
              });
            },
            gestureRecognizers: Set()
              ..add(Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer())),
          ),
          Container(
            alignment: FractionalOffset.center,
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}

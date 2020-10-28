import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import './webview_container.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomSheetHeight = MediaQuery.of(context).size.height / 2;

    return RaisedButton(
      child: const Text('showBottomSheet'),
      onPressed: () {
        showBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return _webviewContainer(bottomSheetHeight, context);
          },
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(),
        );
      },
    );
  }

  Widget _webviewContainer(double bottomSheetHeight, BuildContext context) {
    return Container(
      height: bottomSheetHeight,
      child: Stack(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Container(
            width: double.infinity,
            height: bottomSheetHeight - 18,
            decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: WebViewContainer(
                'https://duckduckgo.com',
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.keyboard_arrow_down,
                size: 36,
                color: Colors.white,
              ),
            ),
            onTap: () => Navigator.pop(context),
          ),
        ),
      ]),
    );
  }
}

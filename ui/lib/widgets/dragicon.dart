import 'package:flutter/material.dart';

class DragIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 9),
        child: Container(
          height: 18,
          width: 36,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(12))),
        ),
      ),
      Icon(
        Icons.drag_handle,
        size: 36,
        color: Colors.white,
      ),
    ]);
  }
}

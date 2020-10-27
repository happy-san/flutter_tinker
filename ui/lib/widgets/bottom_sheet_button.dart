import 'package:flutter/material.dart';

class BottomSheetButton extends StatelessWidget {
  final BuildContext context;
  final List<int> list = const [
    234,
    23,
    4,
    234,
    23,
    423,
    4,
    234,
    2,
    534,
    5,
    456,
    57,
    65,
    613,
    4,
    5234,
    64,
    75,
    8,
    636,
    54,
    6
  ];

  const BottomSheetButton(
    this.context, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(context) {
    final bottomSheetHeight = MediaQuery.of(context).size.height / 2;

    return RaisedButton(
      child: const Text('showBottomSheet'),
      onPressed: () {
        Scaffold.of(context).showBottomSheet<void>(
          (BuildContext context) {
            return Container(
              height: bottomSheetHeight,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Stack(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Container(
                    width: double.infinity,
                    height: bottomSheetHeight - 18,
                    color: Colors.blueAccent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Center(child: Text(list[index].toString()));
                        },
                        itemCount: list.length,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      child: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 36,
                      ),
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ]),
            );
          },
        );
      },
    );
  }
}
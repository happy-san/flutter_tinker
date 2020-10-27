import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Hey'),
      body: Center(
        child: Text('How are you doing!'),
      ),
    );
  }
}

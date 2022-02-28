import 'package:flutter/material.dart';

import 'money_home_bottom_sheet.dart';

class MoneyHomeLayout extends StatelessWidget {
  final bool example;

  const MoneyHomeLayout({Key? key, this.example = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
      //MoneyHomeStatic(),
      Align(alignment: Alignment.bottomCenter, child: MoneyHomeBottomSheet(example: example)),
    ]);
  }
}

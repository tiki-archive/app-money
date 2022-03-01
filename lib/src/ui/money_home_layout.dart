import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../money_service.dart';
import 'money_home_bottom_sheet.dart';

class MoneyHomeLayout extends StatelessWidget {
  final bool example;

  const MoneyHomeLayout({Key? key, this.example = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return Stack(
        children: [
      //MoneyHomeStatic(),
    MoneyHomeBottomSheet( transactions: example ? service.generateList() : service.model.transactions, example: example),
    ]);
  }
}

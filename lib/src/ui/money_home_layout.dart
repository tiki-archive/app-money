import 'package:flutter/material.dart';
import 'package:money/src/ui/money_home_view_header.dart';

class MoneyHomeLayout extends StatelessWidget{

  const MoneyHomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: MoneyHomeViewHeader()
    );
  }

}
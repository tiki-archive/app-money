/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:style/style.dart';

import '../money_service.dart';

class MoneyHomeViewAmount extends StatelessWidget {
  static const String _text = "your balance";

  const MoneyHomeViewAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    double balance = service.model.balance;
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "\$" + balance.toStringAsFixed(0),
            textAlign: TextAlign.right,
            style: TextStyle(
                color: ColorProvider.tikiBlue,
                fontFamily: "Koara",
                package: 'money',
                fontWeight: FontWeight.bold,
                height: 0,
                fontSize: SizeProvider.instance.text(64)),
          ),
          Container(
              margin: EdgeInsets.only(top: SizeProvider.instance.size(16)),
              child: Text(
                _text,
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: const Color(0xFF545454),
                    fontFamily: "Koara",
                    fontWeight: FontWeight.bold,
                    fontSize: SizeProvider.instance.text(12)),
              ))
        ]);
  }
}

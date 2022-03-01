/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../money_service.dart';

class MoneyHomeViewCashOutText extends StatelessWidget {
  static const String _text =
      "Sell your data & cash out your \nearnings to your bank account";

  const MoneyHomeViewCashOutText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return Text(
      _text,
      style: TextStyle(
          color: service.style.textColor,
          fontWeight: FontWeight.w600,
          fontSize: service.style.text(12)),
    );
  }
}

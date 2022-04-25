/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:style/style.dart';

class MoneyHomeViewCashOutText extends StatelessWidget {
  static const String _text =
      "Sell your data & cash out your \nearnings to your bank account";

  const MoneyHomeViewCashOutText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(
          color: ColorProvider.tikiBlue,
          fontWeight: FontWeight.w600,
          fontSize: SizeProvider.instance.text(12)),
    );
  }
}

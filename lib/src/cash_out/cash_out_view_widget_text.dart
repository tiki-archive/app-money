/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class CashOutViewWidgetText extends StatelessWidget {
  static const String _text =
      "Sell your data & cash out your \nearnings to your bank account";

  const CashOutViewWidgetText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(_text,
        style: TextStyle(
            color: ColorProvider.tikiBlue,
            fontWeight: FontWeight.w600,
            fontFamily: TextProvider.familyNunitoSans,
            height: 1.1,
            package: TextProvider.package,
            fontSize: SizeProvider.instance.text(14)));
  }
}

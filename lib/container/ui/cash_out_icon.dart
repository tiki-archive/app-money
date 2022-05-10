/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class MoneyContainerUiCashOutIcon extends StatelessWidget {
  static const String _text = "Cash out";

  const MoneyContainerUiCashOutIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                  color: ColorProvider.greyFour,
                  borderRadius: BorderRadius.circular(SizeProvider.instance.size(30))),
              child: const Center(
                  child: Icon(IconProvider.upload, color: ColorProvider.white),
            ))
          ],
        ),
        Container(
            margin: EdgeInsets.only(top: SizeProvider.instance.size(2)),
            child: Text(
              _text,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: TextProvider.familyNunitoSans,
                  package: 'tiki_style',
                  fontSize: SizeProvider.instance.text(15),
                  color: ColorProvider.greyFour),
            ))
      ],
    );
  }
}

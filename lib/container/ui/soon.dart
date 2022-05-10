/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class MoneyContainerUiSoon extends StatelessWidget {
  static const String _text = "You’ll be able to \nsell your data soon";

  const MoneyContainerUiSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              child: ImgProvider.iconInfo,
            width: SizeProvider.instance.text(18),
          ),
          Text(
            _text,
            style: TextStyle(
                fontFamily: TextProvider.familyNunitoSans,
                package: 'tiki_style',
                color: ColorProvider.tikiBlue,
                fontWeight: FontWeight.w700,
                fontSize: SizeProvider.instance.text(14)),
          )
        ]);
  }
}

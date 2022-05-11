/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class MoneyContainerUiCashOutBanner extends StatelessWidget {
  static const String _text = "Coming soon";

  const MoneyContainerUiCashOutBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: ImgProvider.bannerCyan,
          height: SizeProvider.instance.size(30),
        ),
        Container(
            margin: EdgeInsets.symmetric(
                vertical: SizeProvider.instance.size(4),
                horizontal: SizeProvider.instance.size(12)),
            child: Text(
              _text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: TextProvider.familyNunitoSans,
                  package: 'tiki_style',
                  fontSize: SizeProvider.instance.text(16),
                  color: ColorProvider.tikiBlue),
            ))
      ],
    );
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ContainerHomeViewSoon extends StatelessWidget {
  static const String _text = "You’ll be able to \nsell your data soon";

  const ContainerHomeViewSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              child: ImgProvider.infoIcon,
            width: SizeProvider.instance.text(18),
          ),
          Text(
            _text,
            style: TextStyle(
                color: ColorProvider.tikiBlue,
                fontWeight: FontWeight.w800,
                fontSize: SizeProvider.instance.text(14)),
          )
        ]);
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:style/style.dart';

class MoneyHomeViewSoon extends StatelessWidget {
  static const String _text = "You’ll be able to \nsell your data soon";

  const MoneyHomeViewSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              child: Image(
            image:
                const AssetImage('res/images/info-icon.png', package: 'money'),
            width: SizeProvider.instance.text(18),
            fit: BoxFit.cover,
          )),
          Container(
              margin: EdgeInsets.only(top: SizeProvider.instance.text(8)),
              child: Text(
                _text,
                style: TextStyle(
                    color: ColorProvider.tikiBlue,
                    fontWeight: FontWeight.w800,
                    fontSize: SizeProvider.instance.text(14)),
              ))
        ]);
  }
}

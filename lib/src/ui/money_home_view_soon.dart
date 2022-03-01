/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:money/src/money_service.dart';
import 'package:provider/provider.dart';

class MoneyHomeViewSoon extends StatelessWidget {
  static const String _text = "You’ll be able to \nsell your data soon";

  const MoneyHomeViewSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              child: Image(
            image:
                const AssetImage('res/images/info-icon.png', package: 'money'),
            width: service.style.text(18),
            fit: BoxFit.cover,
          )),
          Container(
              margin: EdgeInsets.only(top: service.style.text(8)),
              child: Text(
                _text,
                style: TextStyle(
                    color: service.style.textColor,
                    fontWeight: FontWeight.w800,
                    fontSize: service.style.text(14)),
              ))
        ]);
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:money/src/money_service.dart';
import 'package:provider/provider.dart';

class MoneyHomeViewCashOutBanner extends StatelessWidget {
  static const String _text = "Coming soon";

  const MoneyHomeViewCashOutBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return Stack(
      children: [
        Image(
          image: const AssetImage('res/images/banner.png', package: 'money'),
          height: service.style.size(25),
          fit: BoxFit.cover,
        ),
        Container(
            margin: EdgeInsets.symmetric(
                vertical: service.style.size(6),
                horizontal: service.style.size(12)),
            child: Text(
              _text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: service.style.text(12),
                  color: service.style.textColor),
            ))
      ],
    );
  }
}

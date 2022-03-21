/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../money_service.dart';

class MoneyHomeViewCashOutIcon extends StatelessWidget {
  static const String _text = "Cash out";

  const MoneyHomeViewCashOutIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              padding: EdgeInsets.all(service.style.size(12)),
              decoration: BoxDecoration(
                  color: const Color(0xFFAFAFAF),
                  borderRadius: BorderRadius.circular(service.style.size(60)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0x0D000000),
                      blurRadius: service.style.size(4),
                      offset: Offset(service.style.size(2),
                          service.style.size(2)), // Shadow position
                    ),
                  ]),
              child: Center(
                  child: Image.asset("res/images/upload-icon.png",
                      package: 'money')),
            )
          ],
        ),
        Container(
            margin: EdgeInsets.only(top: service.style.size(2)),
            child: Text(
              _text,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: service.style.text(12),
                  color: const Color(0xFFAFAFAF)),
            ))
      ],
    );
  }
}

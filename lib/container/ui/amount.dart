/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../money_service.dart';

class ContainerHomeViewAmount extends StatelessWidget {
  static const String _text = "your balance";

  const ContainerHomeViewAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContainerService service = Provider.of<ContainerService>(context);
    double balance = service.model.balance;
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "\$" + balance.toStringAsFixed(0),
            textAlign: TextAlign.right,
            style: TextStyle(
                color: ColorProvider.tikiBlue,
                fontFamily: TextProvider.familyKoara,
                package: 'style',
                fontWeight: FontWeight.bold,
                height: 0,
                fontSize: SizeProvider.instance.text(64)),
          ),
          Container(
              margin: EdgeInsets.only(top: SizeProvider.instance.size(16)),
              child: Text(
                _text,
                textAlign: TextAlign.right,
                style: TextStyle(
                    color: const Color(0xFF545454),
                    fontFamily: TextProvider.familyKoara,
                    package: 'style',
                    fontWeight: FontWeight.bold,
                    fontSize: SizeProvider.instance.text(12)),
              ))
        ]);
  }
}

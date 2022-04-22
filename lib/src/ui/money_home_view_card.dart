/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:style/style.dart';

class MoneyHomeViewCard extends StatelessWidget {
  const MoneyHomeViewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ImgProvider.walletCard,
        alignment: Alignment.center,
    );
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';

class MoneyHomeViewCard extends StatelessWidget {
  const MoneyHomeViewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('res/images/wallet-card.png', package: 'money'),
      width: double.infinity,
      fit: BoxFit.cover,
      alignment: Alignment.center,
    );
  }
}

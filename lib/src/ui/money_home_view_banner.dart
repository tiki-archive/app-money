/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../money_service.dart';

class MoneyHomeViewBanner extends StatelessWidget {

  const MoneyHomeViewBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return Image(
      image: const AssetImage('res/images/ref-only-banner.png', package: 'money'),
      height: service.style.size(80),
      fit: BoxFit.fitHeight,
    );
  }
}

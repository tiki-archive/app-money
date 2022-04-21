/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:style/style.dart';

class MoneyHomeViewBanner extends StatelessWidget {
  const MoneyHomeViewBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image:
          const AssetImage('res/images/ref-only-banner.png', package: 'money'),
      height: SizeProvider.instance.size(80),
      fit: BoxFit.fitHeight,
    );
  }
}

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
    return SizedBox(
      child: ImgProvider.refOnlyBanner,
      height: SizeProvider.instance.size(80),
    );
  }
}

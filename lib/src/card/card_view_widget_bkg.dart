/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class CardViewWidgetBkg extends StatelessWidget {
  const CardViewWidgetBkg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: SizeProvider.instance.width(320),
        height: SizeProvider.instance.width(207),
        child: FittedBox(fit: BoxFit.fill, child: ImgProvider.walletCard));
  }
}

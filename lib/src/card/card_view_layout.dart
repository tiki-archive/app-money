/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'card_view_widget_amount.dart';
import 'card_view_widget_banner.dart';
import 'card_view_widget_bkg.dart';
import 'card_view_widget_soon.dart';

class CardViewLayout extends StatelessWidget {
  const CardViewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(SizeProvider.instance.size(15)),
            boxShadow: [
              BoxShadow(
                  color: ColorProvider.greyFive,
                  blurRadius: SizeProvider.instance.width(10),
                  offset: Offset(SizeProvider.instance.width(1),
                      SizeProvider.instance.width(1)) // Shadow position
                  )
            ]),
        width: SizeProvider.instance.width(320),
        height: SizeProvider.instance.height(207),
        child: Stack(children: [
          const CardViewWidgetBkg(),
          const CardViewWidgetBanner(),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: SizeProvider.instance.width(73),
                  horizontal: SizeProvider.instance.width(18)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    CardViewWidgetSoon(),
                    CardViewWidgetAmount()
                  ]))
        ]));
  }
}

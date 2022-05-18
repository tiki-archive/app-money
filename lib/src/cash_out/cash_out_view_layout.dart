/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'cash_out_view_widget_banner.dart';
import 'cash_out_view_widget_icon.dart';
import 'cash_out_view_widget_text.dart';

class CashOutViewLayout extends StatelessWidget {
  const CashOutViewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeProvider.instance.height(110),
        width: SizeProvider.instance.height(320),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(SizeProvider.instance.size(22))),
        child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: SizeProvider.instance.size(17)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CashOutViewWidgetBanner(),
                        Container(
                            margin: EdgeInsets.only(
                                left: SizeProvider.instance.size(12),
                                top: SizeProvider.instance.size(12)),
                            child: const CashOutViewWidgetText())
                      ]),
                  Container(
                      margin: EdgeInsets.only(
                          right: SizeProvider.instance.size(30)),
                      child: const CashOutViewWidgetIcon())
                ])));
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:style/style.dart';

import 'money_home_view_cash_out_banner.dart';
import 'money_home_view_cash_out_icon.dart';
import 'money_home_view_cash_out_text.dart';

class MoneyHomeViewCashOut extends StatelessWidget {
  const MoneyHomeViewCashOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(SizeProvider.instance.size(12)),
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: SizeProvider.instance.size(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MoneyHomeViewCashOutBanner(),
                    Container(
                        margin: EdgeInsets.only(
                            left: SizeProvider.instance.size(20),
                            top: SizeProvider.instance.size(8)),
                        child: const MoneyHomeViewCashOutText())
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(right: SizeProvider.instance.size(15)),
                    child: const MoneyHomeViewCashOutIcon())
              ],
            )));
  }
}

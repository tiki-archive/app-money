/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:money/src/money_service.dart';
import 'package:provider/provider.dart';
import 'money_home_view_cash_out_banner.dart';
import 'money_home_view_cash_out_icon.dart';
import 'money_home_view_cash_out_text.dart';

class MoneyHomeViewCashOut extends StatelessWidget {

  const MoneyHomeViewCashOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
         borderRadius: BorderRadius.circular(service.style.size(12)),
          /*boxShadow: [
            BoxShadow(
              color: Color(0x0D000000),
              blurRadius: 2.w,
              offset: Offset(0.75.w, 0.75.w), // Shadow position
            ),
          ],*/
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: service.style.size(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MoneyHomeViewCashOutBanner(),
                    Container(
                        margin: EdgeInsets.only(left: service.style.size(20), top: service.style.size(8)),
                        child: MoneyHomeViewCashOutText())
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(right: service.style.size(15)),
                    child: MoneyHomeViewCashOutIcon())
              ],
            )));
  }
}

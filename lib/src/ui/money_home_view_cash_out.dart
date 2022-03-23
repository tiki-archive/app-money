/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../money_service.dart';
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
                    const MoneyHomeViewCashOutBanner(),
                    Container(
                        margin: EdgeInsets.only(
                            left: service.style.size(20),
                            top: service.style.size(8)),
                        child: const MoneyHomeViewCashOutText())
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(right: service.style.size(15)),
                    child: const MoneyHomeViewCashOutIcon())
              ],
            )));
  }
}

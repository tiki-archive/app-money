import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../money_service.dart';
import 'bottom_sheet/money_home_bottom_sheet.dart';
import 'money_home_view_amount.dart';
import 'money_home_view_banner.dart';
import 'money_home_view_card.dart';
import 'money_home_view_cash_out.dart';
import 'money_home_view_soon.dart';

class MoneyHomeLayout extends StatelessWidget {
  final bool example;

  const MoneyHomeLayout({Key? key, this.example = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return SizedBox(
        height: double.infinity,
        child: Stack(children: [
          Container(
              height: SizeProvider.instance.size(350.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(SizeProvider.instance.size(15)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x0D000000),
                    blurRadius: SizeProvider.instance.size(6),
                    offset: Offset(SizeProvider.instance.size(2),
                        SizeProvider.instance.size(2)), // Shadow position
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                  top: SizeProvider.instance.size(8),
                  right: SizeProvider.instance.size(16),
                  left: SizeProvider.instance.size(16)),
              child: Column(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(SizeProvider.instance.size(15)),
                    child: Stack(children: [
                      const MoneyHomeViewCard(),
                      const MoneyHomeViewBanner(),
                      Container(
                          margin: EdgeInsets.only(top: SizeProvider.instance.size(80)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      left: SizeProvider.instance.size(15)),
                                  child: const MoneyHomeViewSoon()),
                              Container(
                                  margin: EdgeInsets.only(
                                      right: SizeProvider.instance.size(15)),
                                  child: const MoneyHomeViewAmount())
                            ],
                          ))
                    ])),
                Padding(padding: EdgeInsets.only(top: SizeProvider.instance.size(20))),
                const MoneyHomeViewCashOut()
              ])),
          MoneyHomeBottomSheet(
              transactions:
                  example ? service.generateList() : service.model.transactions,
              example: example),
        ]));
  }
}

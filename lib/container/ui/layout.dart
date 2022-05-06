import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../service.dart';
import 'amount.dart';
import 'banner.dart';
import 'card.dart';
import 'cash_out.dart';
import 'soon.dart';

class MoneyContainerUiLayout extends StatelessWidget {
  final bool example;

  const MoneyContainerUiLayout({Key? key, this.example = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContainerService service = Provider.of<ContainerService>(context);
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
                      const MoneyContainerUiCard(),
                      const MoneyContainerUiBanner(),
                      Container(
                          margin: EdgeInsets.only(top: SizeProvider.instance.size(80)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.only(
                                      left: SizeProvider.instance.size(15)),
                                  child: const MoneyContainerUiSoon()),
                              Container(
                                  margin: EdgeInsets.only(
                                      right: SizeProvider.instance.size(15)),
                                  child: const MoneyContainerUiAmount())
                            ],
                          ))
                    ])),
                Padding(padding: EdgeInsets.only(top: SizeProvider.instance.size(20))),
                const MoneyContainerUiCashOut()
              ])),
          service.statement.presenter.bottomSheet()
        ]));
  }
}

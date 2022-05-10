import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../service.dart';
import 'cash_out.dart';
import 'soon_card.dart';

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
              padding: EdgeInsets.only(
                  top: SizeProvider.instance.size(8),
                  right: SizeProvider.instance.size(18),
                  left: SizeProvider.instance.size(18)),
              child: Column(children: [
                MoneyContainerUiSoonCard(),
                Padding(padding: EdgeInsets.only(top: SizeProvider.instance.size(10))),
                const MoneyContainerUiCashOut()
              ])),
          service.statement.presenter.bottomSheet(example:example)
        ]));
  }
}

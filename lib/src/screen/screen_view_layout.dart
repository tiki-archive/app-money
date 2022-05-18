import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../cash_out/cash_out_view_layout.dart';

class ScreenViewLayout extends StatelessWidget {
  final Widget? card;
  final Widget? history;

  const ScreenViewLayout({Key? key, this.card, this.history}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(top: SizeProvider.instance.size(8)),
          child: Column(children: [
            if (card != null) card!,
            Padding(
                padding: EdgeInsets.only(top: SizeProvider.instance.size(20))),
            const CashOutViewLayout()
          ])),
      if (history != null) history!
    ]);
  }
}

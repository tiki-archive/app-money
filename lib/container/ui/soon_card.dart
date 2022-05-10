import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'soon.dart';
import 'package:tiki_style/tiki_style.dart';

import 'amount.dart';
import 'banner.dart';
import 'card.dart';

class MoneyContainerUiSoonCard extends StatelessWidget {
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
                  SizeProvider.instance.width(1)), // Shadow position
            ),
          ],
        ),
        width: SizeProvider.instance.width(320),
        height: SizeProvider.instance.height(215),

        child: Stack(children: [
        const MoneyContainerUiCard(),
        const MoneyContainerUiBanner(),
        Container(
            padding: EdgeInsets.symmetric(horizontal: SizeProvider.instance.width(18)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                MoneyContainerUiSoon(),
                MoneyContainerUiAmount()
              ],
            ))
      ]));
  }
}
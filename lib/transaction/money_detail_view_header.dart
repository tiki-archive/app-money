import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'money_model_transaction.dart';

class MoneyDetailViewHeader extends StatelessWidget {
  final MoneyModelTransaction transaction;

  const MoneyDetailViewHeader({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: SizeProvider.instance.size(24)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                      alignment: Alignment.center,
                      child: Container(
                          padding:
                              EdgeInsets.only(left: SizeProvider.instance.size(25)),
                          child: const Center(
                              child: Icon(IconProvider.arrow_left, color: ColorProvider.greyTwo))))),
              Container(
                  alignment: Alignment.center,
                  child: Text("NFT ${transaction.id.substring(0, 10)}",
                      style: TextStyle(
                          color: ColorProvider.tikiBlue,
                          fontSize: SizeProvider.instance.size(16)))),
              SizedBox.fromSize(
                  size: Size(SizeProvider.instance.size(40), SizeProvider.instance.size(40)))
            ]));
  }
}

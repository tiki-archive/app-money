import 'package:flutter/material.dart';
import 'package:money/src/model/money_model_transaction.dart';
import 'package:provider/provider.dart';

import '../money_service.dart';

class MoneyDetailViewHeader extends StatelessWidget {
  final MoneyModelTransaction transaction;

  const MoneyDetailViewHeader({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return Padding(padding: EdgeInsets.only(top: service.style.size(24)),
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
                          padding: EdgeInsets.only(left: service.style.size(25)),
                          child: Center(
                              child: Image.asset(
                                  "res/images/icon-back.png",
                                  package: 'money'
                              ))))),
              Container(
                  alignment: Alignment.center,
                  child: Text("NFT ${transaction.id.substring(0, 10)}",
                      style: TextStyle(
                          color: service.style.textColor,
                          fontSize: service.style.size(16)))),
            SizedBox.fromSize(
                size: Size(service.style.size(40),service.style.size(40)))
            ]));
  }
}

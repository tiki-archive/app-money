import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../model/money_model_transaction.dart';
import '../model/money_model_transaction_type.dart';


class MoneyTransactionUiHeader extends StatelessWidget {
  final TransactionModel transaction;

  const MoneyTransactionUiHeader({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: SizeProvider.instance.size(25),
            bottom: SizeProvider.instance.size(8),
            left: SizeProvider.instance.size(16),
            right: SizeProvider.instance.size(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: SizeProvider.instance.size(16)),
                child: CircleAvatar(
                    radius: SizeProvider.instance.size(70),
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                        radius: SizeProvider.instance.size(68),
                        backgroundColor: Colors.amberAccent,
                        child: Icon(transaction.type.icon, size: SizeProvider.instance.size(60), color: ColorProvider.white)))),
            Padding(
              padding: EdgeInsets.only(bottom: SizeProvider.instance.size(16)),
              child: Text("${transaction.unit} ${transaction.ammount}",
                  style: TextStyle(
                      color: ColorProvider.tikiBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeProvider.instance.text(30),
                      fontFamily: TextProvider.familyKoara,
                      package: 'style')),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: SizeProvider.instance.size(16)),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Subject: ",
                      style: TextStyle(
                        color: ColorProvider.tikiBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeProvider.instance.text(12),
                      ),
                      children: [
                        TextSpan(
                          text: transaction.subject,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        )
                      ])),
            )
          ],
        ));
  }
}

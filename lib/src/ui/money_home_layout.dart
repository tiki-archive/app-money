import 'package:flutter/material.dart';
import 'package:money/src/model/money_model_transaction.dart';
import 'package:money/src/model/money_model_transaction_type.dart';
import 'package:money/src/ui/money_home_view_header.dart';
import 'package:money/src/ui/money_home_view_list_transaction.dart';

class MoneyHomeLayout extends StatelessWidget {
  const MoneyHomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyModelTransaction transaction = MoneyModelTransaction(
        type: MoneyModelTransactionType.subject,
        id: "0xab31ef1084937645fca",
        minted: DateTime(2021, 7, 10, 9, 19, 00),
        backedUp: DateTime(2021, 7, 10, 9, 23, 00),
        listedOn: DateTime(2021, 7, 11, 12, 14, 00),
        fingerprint: '0xab5318403cd',
        subject: 'Build & embed ML models into edge devices? Do it for free!',
        unit: 'μ¢',
        ammount: '2.01');
    return Column(children: [
      const MoneyHomeViewHeader(),
      MoneyHomeViewListTransaction(transaction: transaction)
    ]);
  }
}

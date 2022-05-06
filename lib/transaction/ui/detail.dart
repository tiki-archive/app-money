import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../model/money_model_transaction.dart';
import 'content_header.dart';
import 'detail_table.dart';
import 'header.dart';

class MoneyTransactionUiDetail extends StatelessWidget {
  final TransactionModel transaction;

  const MoneyTransactionUiDetail({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          MoneyDetailViewHeader(transaction: transaction),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeProvider.instance.size(25),
                      right: SizeProvider.instance.size(25),
                      bottom: SizeProvider.instance.size(16)),
                  child: Column(children: [
                    MoneyTransactionUiHeader(transaction: transaction),
                    Expanded(
                        child: Center(
                            child: MoneyTransactionUiTable(
                                transaction: transaction)))
                  ])))
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../model/money_model_transaction.dart';
import '../service.dart';
import 'content_header.dart';
import 'detail_table.dart';
import 'header.dart';

class MoneyTransactionUiDetail extends StatelessWidget {

  const MoneyTransactionUiDetail({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionService service = Provider.of<TransactionService>(context);
    TransactionModel transaction = service.transaction;
    return SizedBox(
        height: MediaQuery.of(context).size.height - SizeProvider.instance.height(180),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          MoneyDetailViewHeader(transaction: transaction),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeProvider.instance.size(40),
                      right: SizeProvider.instance.size(40),
                      bottom: SizeProvider.instance.size(16)),
                  child: Column(children: [
                    MoneyTransactionUiHeader(transaction: transaction),
                    MoneyTransactionUiTable(transaction: transaction)
                  ])))
        ]));
  }
}

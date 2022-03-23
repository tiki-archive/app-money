import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/money_model_transaction.dart';
import '../../money_service.dart';
import 'money_detail_view_content_header.dart';
import 'money_detail_view_content_table.dart';
import 'money_detail_view_header.dart';

class MoneyDetailLayout extends StatelessWidget {
  final MoneyModelTransaction transaction;

  const MoneyDetailLayout({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          MoneyDetailViewHeader(transaction: transaction),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(
                      left: service.style.size(25),
                      right: service.style.size(25),
                      bottom: service.style.size(16)),
                  child: Column(children: [
                    MoneyDetailViewContentHeader(transaction: transaction),
                    Expanded(
                        child: Center(
                            child: MoneyDetailViewContentTable(
                                transaction: transaction)))
                  ])))
        ]));
  }
}

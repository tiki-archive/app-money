import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../src/model/money_model_transaction.dart';
import '../src/ui/detail/money_detail_view_content_header.dart';
import 'money_detail_view_content_table.dart';
import '../src/ui/detail/money_detail_view_header.dart';

class MoneyDetailLayout extends StatelessWidget {
  final MoneyModelTransaction transaction;

  const MoneyDetailLayout({Key? key, required this.transaction})
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
                    MoneyDetailViewContentHeader(transaction: transaction),
                    Expanded(
                        child: Center(
                            child: MoneyDetailViewContentTable(
                                transaction: transaction)))
                  ])))
        ]));
  }
}

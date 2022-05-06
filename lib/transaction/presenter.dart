import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'model/money_model_transaction.dart';
import 'service.dart';
import 'ui/detail.dart';

class TransactionPresenter{

  final TransactionService service;
  TransactionPresenter(this.service);

  Future<void> openDetail(
      BuildContext context, TransactionModel transaction) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: ColorProvider.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(SizeProvider.instance.size(36)))),
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: service,
            child: MoneyTransactionUiDetail(transaction: transaction)));
  }


}
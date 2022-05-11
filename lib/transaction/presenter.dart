import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'service.dart';
import 'ui/detail.dart';
import 'ui/transaction.dart';

class TransactionPresenter{

  final TransactionService service;
  TransactionPresenter(this.service);

  Widget item() => ChangeNotifierProvider.value(
      value: service,
      child: const MoneyTransactionItem());

  Future<void> openDetail(BuildContext context) {
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
            child: const MoneyTransactionUiDetail()));
  }


}
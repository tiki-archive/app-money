import 'package:flutter/material.dart';
import 'package:httpp/httpp.dart';

export 'transaction/model/money_model_transaction.dart';

import 'container/service.dart';
import 'transaction/model/money_model_transaction.dart' as transaction;

class TikiMoney {
  late final ContainerService _service;

  TikiMoney({Httpp? httpp, required int referalCount,
    List<transaction.TransactionModel> transactions = const []})
      : _service = ContainerService(
            httpp: httpp ?? Httpp(),
            referalCount: referalCount) {
    pushTransactions(transactions);
  }

  Widget screen({bool example = false}) =>
      _service.presenter.home(example: example);

  void pushTransactions(List<transaction.TransactionModel> transactions,
      {bool overwrite = false}) =>
        _service.statement.pushTransactions(transactions, overwrite: overwrite);
}

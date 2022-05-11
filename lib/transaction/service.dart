import 'package:flutter/cupertino.dart';

import 'controller.dart';
import 'model/money_model_transaction.dart';
import 'presenter.dart';

class TransactionService extends ChangeNotifier{
  late final TransactionController controller;
  late final TransactionPresenter presenter;

  final TransactionModel transaction;

  TransactionService(this.transaction){
    controller = TransactionController(this);
    presenter = TransactionPresenter(this);
  }

}

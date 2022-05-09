import 'package:flutter/cupertino.dart';

import '../transaction/model/money_model_transaction.dart';
import 'model.dart';
import 'presenter.dart';

class StatementService extends ChangeNotifier{

  late final StatementPresenter presenter;
  late final StatementModel _model;

  StatementService() {
    presenter = StatementPresenter(this);
    _model = StatementModel();
  }

  List<TransactionModel> get transactions => _model.transactions;

  void pushTransactions(List<TransactionModel> transactions, {required bool overwrite}) {
    if(!overwrite){
      _model.transactions = [...transactions, ..._model.transactions];
    }else{
      _model.transactions = transactions;
    }
    notifyListeners();
  }
}
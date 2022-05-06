import 'package:flutter/cupertino.dart';

import 'controller.dart';
import 'presenter.dart';

class TransactionService extends ChangeNotifier{
  late final TransactionController controller;
  late final TransactionPresenter presenter;

  TransactionService(){
    controller = TransactionController(this);
    presenter = TransactionPresenter(this);
  }

}

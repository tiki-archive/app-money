import 'package:flutter/cupertino.dart';

import '../src/model/money_model_transaction.dart';
import '../src/money_service.dart';

class MoneyController {
  final MoneyService service;

  MoneyController(this.service);

  void openDetail(BuildContext context, MoneyModelTransaction transaction) {
    service.presenter.openDetail(context, transaction);
  }
}

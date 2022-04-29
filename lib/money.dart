import 'package:flutter/material.dart';
import 'package:httpp/httpp.dart';
import 'package:money/src/model/money_model_transaction.dart';
import 'package:tiki_style/tiki_style.dart';

import 'src/money_service.dart';

class Money {
  late final MoneyService _service;

  Money({Httpp? httpp, String? referalCode})
      : _service = MoneyService(
            style: TikiStyle.instance,
            httpp: httpp ?? Httpp(),
            referalCode: referalCode);

  Widget home({List<MoneyModelTransaction>? transactions}) =>
      _service.presenter.home(transactionList: transactions);
}

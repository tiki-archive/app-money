/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';

import 'card_model.dart';
import 'card_presenter.dart';

class CardService extends ChangeNotifier {
  final CardModel model = CardModel();
  late final CardPresenter presenter;

  CardService({int referralCount = 0}) {
    model.balance = 5.0 * (referralCount ~/ 10.0);
    presenter = CardPresenter(this);
  }

  void setBalance(double balance) {
    model.balance = balance;
    notifyListeners();
  }
}

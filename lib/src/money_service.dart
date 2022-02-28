import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';

import 'model/money_model.dart';
import 'money_controller.dart';
import 'money_presenter.dart';
import 'money_style.dart';

class MoneyService extends ChangeNotifier {
  final Logger _log = Logger('MoneyService');

  late final MoneyModel model;
  late final MoneyPresenter presenter;
  late final MoneyController controller;
  late final MoneyStyle style;

  MoneyService({required this.style}) {
    presenter = MoneyPresenter(this);
    model = MoneyModel();
    controller = MoneyController(this);
  }
}

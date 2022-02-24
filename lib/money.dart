import 'package:flutter/material.dart';
import 'package:money/src/money_service.dart';
import 'package:money/src/money_style.dart';

class Money {
  late final MoneyService _service;

  Money({MoneyStyle? style})
      : _service = MoneyService(style: style ?? MoneyStyle());

  Widget home() => _service.presenter.home();

}

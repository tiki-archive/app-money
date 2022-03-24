import 'package:flutter/material.dart';
import 'package:httpp/httpp.dart';

import 'src/money_service.dart';
import 'src/money_style.dart';

class Money {
  late final MoneyService _service;

  Money({MoneyStyle? style, Httpp? httpp, String? referalCode})
      : _service = MoneyService(
            style: style ?? MoneyStyle(),
            httpp: httpp ?? Httpp(),
            referalCode: referalCode);

  Widget home({bool example = false}) =>
      _service.presenter.home(example: example);
}

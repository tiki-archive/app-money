import 'package:flutter/material.dart';
import 'package:httpp/httpp.dart';
import 'package:tiki_style/tiki_style.dart';

import 'src/money_service.dart';

class TikiMoney {
  late final MoneyService _service;

  TikiMoney({Httpp? httpp, String? referalCode})
      : _service = MoneyService(
            httpp: httpp ?? Httpp(),
            referalCode: referalCode);

  Widget home({bool example = false}) =>
      _service.presenter.home(example: example);
}

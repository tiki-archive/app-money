import 'package:flutter/material.dart';
import 'package:httpp/httpp.dart';

class TikiMoney {
  late final MoneyService _service;

  TikiMoney({Httpp? httpp, required int referalCode})
      : _service = MoneyService(
            httpp: httpp ?? Httpp(),
            referalCount: referalCount);

  Widget home({bool example = false}) =>
      _service.presenter.home(example: example);
}

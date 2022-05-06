import 'package:flutter/material.dart';
import 'package:httpp/httpp.dart';

import 'container/service.dart';

class TikiMoney {
  late final ContainerService _service;

  TikiMoney({Httpp? httpp, required int referalCount})
      : _service = ContainerService(
            httpp: httpp ?? Httpp(),
            referalCount: referalCount);

  Widget screen({bool example = false}) =>
      _service.presenter.home(example: example);

}

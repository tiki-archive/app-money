import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'service.dart';
import 'ui/bottom_sheet.dart';

class StatementPresenter{
  final StatementService service;

  StatementPresenter(this.service);

  Widget bottomSheet({bool example = false}) =>
      ChangeNotifierProvider.value(
          value: service,
          child: StatementBottomSheet(example: example));
}
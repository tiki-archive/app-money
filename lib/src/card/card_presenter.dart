/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'card_service.dart';
import 'card_view_layout.dart';

class CardPresenter {
  final CardService _service;

  CardPresenter(this._service);

  Widget get widget => ChangeNotifierProvider.value(
      value: _service, child: const CardViewLayout());
}

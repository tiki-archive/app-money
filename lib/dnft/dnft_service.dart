/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';

import 'dnft_controller.dart';
import 'dnft_model.dart';
import 'dnft_presenter.dart';

class DNFTService extends ChangeNotifier {
  late final DNFTController controller;
  late final DNFTPresenter presenter;

  final DNFTModel nft;

  DNFTService(this.nft) {
    controller = DNFTController(this);
    presenter = DNFTPresenter(this);
  }
}

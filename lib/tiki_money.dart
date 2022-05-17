/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:httpp/httpp.dart';

import 'dnft/dnft_model.dart';
import 'screen/screen_service.dart';

export 'dnft/dnft_model.dart';
export 'dnft/dnft_model_type.dart';

class TikiMoney {
  late final ScreenService _screenService;

  TikiMoney(
      {Httpp? httpp,
      int referralCount = 0,
      List<DNFTModel> nfts = const [],
      bool example = false})
      : _screenService =
            ScreenService(referralCount: referralCount, example: example) {
    pushTransactions(nfts);
  }

  Widget get screen => _screenService.presenter.screen;

  void pushTransactions(List<DNFTModel> nfts, {bool overwrite = false}) =>
      _screenService.listService.pushTransactions(nfts, overwrite: overwrite);
}

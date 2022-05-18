/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_localgraph/tiki_localgraph.dart';
import 'package:tiki_wallet/tiki_wallet.dart';

import 'src/card/card_service.dart';
import 'src/nft_history/nft_history_service.dart';
import 'src/screen/screen_service.dart';

export 'src/nft_detail/nft_detail_model.dart';
export 'src/nft_detail/nft_detail_model_type.dart';

class TikiMoney {
  late final ScreenService _screenService;

  TikiMoney(
      {required TikiLocalGraph localGraph,
      required TikiChainService chainService,
      int referralCount = 0}) {
    _screenService = ScreenService(
        card: CardService(referralCount: referralCount),
        history: NFTHistoryService(localGraph, chainService));
  }

  Widget get screen => _screenService.presenter.screen;
}

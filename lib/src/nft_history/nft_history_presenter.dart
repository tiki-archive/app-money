/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'nft_history_service.dart';
import 'nft_history_view_layout.dart';

class NFTHistoryPresenter {
  final NFTHistoryService _service;

  NFTHistoryPresenter(this._service);

  Widget get widget => ChangeNotifierProvider.value(
      value: _service, child: const NFTHistoryViewLayout());
}

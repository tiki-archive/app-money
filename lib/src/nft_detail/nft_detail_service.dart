/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';

import 'nft_detail_controller.dart';
import 'nft_detail_model.dart';
import 'nft_detail_presenter.dart';

class NFTDetailService extends ChangeNotifier {
  late final NFTDetailController controller;
  late final NFTDetailPresenter presenter;
  final NFTDetailModel model;

  NFTDetailService(this.model) {
    controller = NFTDetailController(this);
    presenter = NFTDetailPresenter(this);
  }
}

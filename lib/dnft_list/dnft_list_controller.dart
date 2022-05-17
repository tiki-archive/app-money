/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';

import '../dnft/dnft_model.dart';
import '../dnft/dnft_service.dart';
import 'dnft_list_service.dart';

class DNFTListController {
  DNFTListService _service;

  DNFTListController(this._service);

  Future<void> openDetail(BuildContext context, DNFTModel nft) =>
      DNFTService(nft).presenter.open(context);
}

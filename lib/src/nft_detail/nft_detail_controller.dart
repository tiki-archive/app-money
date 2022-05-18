/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';

import 'nft_detail_service.dart';

class NFTDetailController {
  final NFTDetailService _service;

  NFTDetailController(this._service);

  void back(BuildContext context) => Navigator.of(context).pop();
}

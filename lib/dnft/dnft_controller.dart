/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';

import 'dnft_service.dart';

class DNFTController {
  final DNFTService _service;

  DNFTController(this._service);

  void back(BuildContext context) => Navigator.of(context).pop();
}

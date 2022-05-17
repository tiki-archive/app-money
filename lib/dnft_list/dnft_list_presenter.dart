/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dnft_list_service.dart';
import 'dnft_list_view_layout.dart';

class DNFTListPresenter {
  final DNFTListService service;
  final bool? example;

  DNFTListPresenter(this.service, {this.example});

  Widget get widget => ChangeNotifierProvider.value(
      value: service, child: DNFTListViewLayout(example: example));
}

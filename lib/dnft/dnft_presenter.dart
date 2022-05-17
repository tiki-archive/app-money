/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'dnft_service.dart';
import 'dnft_view_layout.dart';

class DNFTPresenter {
  final DNFTService service;
  DNFTPresenter(this.service);

  Future<void> open(BuildContext context) => showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: ColorProvider.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(SizeProvider.instance.size(36)))),
      builder: (BuildContext context) => ChangeNotifierProvider.value(
          value: service, child: const DNFTViewLayout()));
}

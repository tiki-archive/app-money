/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'nft_detail_service.dart';
import 'nft_detail_view_layout.dart';

class NFTDetailPresenter {
  final NFTDetailService service;

  NFTDetailPresenter(this.service);

  Future<void> open(BuildContext context) => showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: ColorProvider.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
              top: Radius.circular(SizeProvider.instance.width(36)))),
      builder: (BuildContext context) => ChangeNotifierProvider.value(
          value: service, child: const NFTDetailViewLayout()));
}

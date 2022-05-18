/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'nft_detail_model.dart';
import 'nft_detail_service.dart';
import 'nft_detail_view_widget_detail.dart';
import 'nft_detail_view_widget_header.dart';
import 'nft_detail_view_widget_summary.dart';

class NFTDetailViewLayout extends StatelessWidget {
  const NFTDetailViewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NFTDetailModel nft = Provider.of<NFTDetailService>(context).model;
    return SizedBox(
        height: MediaQuery.of(context).size.height * .75,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          NFTDetailViewWidgetHeader(nft: nft),
          Expanded(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: SizeProvider.instance.size(40),
                          right: SizeProvider.instance.size(40),
                          bottom: SizeProvider.instance.size(16)),
                      child: Column(children: [
                        NFTDetailViewWidgetSummary(nft: nft),
                        NFTDetailViewWidgetDetail(nft: nft)
                      ]))))
        ]));
  }
}

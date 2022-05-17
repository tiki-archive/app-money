/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'dnft_model.dart';
import 'dnft_service.dart';
import 'dnft_view_widget_detail.dart';
import 'dnft_view_widget_header.dart';
import 'dnft_view_widget_summary.dart';

class DNFTViewLayout extends StatelessWidget {
  const DNFTViewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DNFTModel nft = Provider.of<DNFTService>(context).nft;
    return SizedBox(
        height: MediaQuery.of(context).size.height -
            SizeProvider.instance.height(180),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          DNFTViewWidgetHeader(nft: nft),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(
                      left: SizeProvider.instance.size(40),
                      right: SizeProvider.instance.size(40),
                      bottom: SizeProvider.instance.size(16)),
                  child: Column(children: [
                    DNFTViewWidgetSummary(nft: nft),
                    DNFTViewWidgetDetail(nft: nft)
                  ])))
        ]));
  }
}

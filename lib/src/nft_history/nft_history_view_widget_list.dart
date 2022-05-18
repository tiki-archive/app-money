/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'nft_history_service.dart';
import 'nft_history_view_widget_item.dart';

class NFTHistoryViewWidgetList extends StatelessWidget {
  const NFTHistoryViewWidgetList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NFTHistoryService service = Provider.of<NFTHistoryService>(context);
    if(service.model.nfts.isEmpty) service.load();
    return Container(
        color: Colors.white,
        padding:
            EdgeInsets.symmetric(horizontal: SizeProvider.instance.width(24)),
        child: service.model.nfts.isNotEmpty
            ? ListView.builder(
                controller: service.controller.scrollController,
                itemCount: service.model.nfts.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == service.model.nfts.length - 50) service.nextPage();
                  return NFTHistoryViewWidgetItem(
                      current: service.model.nfts[index],
                      previous:
                      index > 0 ? service.model.nfts[index - 1] : null);
                })
            : const Center(
                child: CircularProgressIndicator(color: ColorProvider.blue)));
  }
}

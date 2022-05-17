/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../dnft/dnft_model.dart';
import 'dnft_list_service.dart';
import 'dnft_list_view_widget_item.dart';

class DNFTListViewWidgetList extends StatelessWidget {
  final bool example;
  final ScrollController scrollController;
  final Function? onRefresh;

  const DNFTListViewWidgetList(
      {Key? key,
      this.onRefresh,
      this.example = false,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DNFTModel> nfts = Provider.of<DNFTListService>(context).model.nfts;
    return Opacity(
        opacity: example ? 0.5 : 1,
        child: Stack(children: [
          example
              ? Align(alignment: Alignment.center, child: ImgProvider.example)
              : Container(),
          Container(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeProvider.instance.width(24)),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: nfts.length,
                  itemBuilder: (context, index) => DNFTListViewWidgetItem(
                      current: nfts[index],
                      previous: index > 0 ? nfts[index - 1] : null)))
        ]));
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'nft_history_service.dart';
import 'nft_history_view_explain.dart';
import 'nft_history_view_widget_list.dart';

class NFTHistoryViewLayout extends StatelessWidget {
  const NFTHistoryViewLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NFTHistoryService service = Provider.of<NFTHistoryService>(context);
    bool isCollapsed = service.model.isCollapsed;
    return AnimatedPositioned(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 250),
        bottom: 0,
        left: 0,
        right: 0,
        top: isCollapsed
            ? MediaQuery.of(context).size.height * .50
            : SizeProvider.instance.height(0),
        child: GestureDetector(
            onVerticalDragEnd: service.controller.onVerticalDragEnd,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(SizeProvider.instance.width(30)),
                    topLeft: Radius.circular(SizeProvider.instance.width(30))),
                child: Container(
                    padding:
                        EdgeInsets.only(top: SizeProvider.instance.height(12)),
                    color: ColorProvider.white,
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                bottom: SizeProvider.instance.height(28)),
                            child: Icon(
                                isCollapsed
                                    ? IconProvider.arrow_wide_up
                                    : IconProvider.arrow_wide_down,
                                color: ColorProvider.greyThree,
                                size: SizeProvider.instance.text(10))),
                        const NFTHistoryViewExplain(),
                        const Expanded(child: NFTHistoryViewWidgetList())
                      ],
                    )))));
  }
}

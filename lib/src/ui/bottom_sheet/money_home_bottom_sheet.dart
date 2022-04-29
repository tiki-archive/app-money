/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import '../../model/money_model_transaction.dart';
import 'money_home_view_header.dart';
import 'money_home_view_list.dart';

class MoneyHomeBottomSheet extends StatefulWidget {

  final List<MoneyModelTransaction> transactions;

  const MoneyHomeBottomSheet(
      {Key? key, required this.transactions})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MoneyBottomSheet();
}

class _MoneyBottomSheet extends State<MoneyHomeBottomSheet> {
  late ScrollController _scrollController;
  double heightFactor = 0.70;
  bool collapsed = true;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 250),
        top: collapsed ? SizeProvider.instance.size(350) : SizeProvider.instance.size(0),
        child: GestureDetector(
            onVerticalDragStart: _onVerticalDragUpdate,
            onVerticalDragEnd: _onVerticalDragEnd,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(SizeProvider.instance.size(30)),
                    topLeft: Radius.circular(SizeProvider.instance.size(30))),
                child: Container(
                    padding: EdgeInsets.only(top: SizeProvider.instance.size(16)),
                    color: Colors.white,
                    child: Column(children: [
                      GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => collapsed ? _expand() : _collapse(),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding:
                                  const EdgeInsets.only(top: 0, bottom: 35),
                              child: Icon(
                                  collapsed ?
                                    IconProvider.arrow_thick_up :
                                    IconProvider.arrow_thick_down,
                                  color: ColorProvider.greyTwo,
                                  size: SizeProvider.instance.text(20)
                              ))),
                      const MoneyHomeViewHeader(),
                      MoneyHomeViewList(
                          transactions: widget.transactions,
                          scrollController: _scrollController),
                    ])))));
  }

  void _onVerticalDragUpdate(DragStartDetails details) {}

  void _onVerticalDragEnd(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dy > 0) {
      if (!collapsed) _collapse();
    } else {
      if (collapsed) _expand();
    }
  }

  _collapse() {
    setState(() {
      collapsed = true;
    });
  }

  _expand() {
    setState(() {
      collapsed = false;
    });
  }

  void _scrollListener() {
    if (collapsed) _expand();
    if (_scrollController.offset <= 1 &&
        !_scrollController.position.outOfRange &&
        !collapsed) _collapse();
  }
}

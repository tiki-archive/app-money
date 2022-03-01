/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:money/src/model/money_model_transaction.dart';
import 'package:provider/provider.dart';

import '../money_service.dart';
import 'money_home_view_header.dart';
import 'money_home_view_list.dart';

class MoneyHomeBottomSheet extends StatefulWidget {
  final bool example;
  final List<MoneyModelTransaction> transactions;
  const MoneyHomeBottomSheet(
      {Key? key, this.example = false, required this.transactions})
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
    MoneyService service = Provider.of<MoneyService>(context);
    return AnimatedPositioned(
        curve: Curves.easeIn,
        duration: const Duration(milliseconds: 250),
        bottom: -MediaQuery.of(context).size.height * heightFactor,
        child: GestureDetector(
            onVerticalDragStart: _onVerticalDragUpdate,
            onVerticalDragEnd: _onVerticalDragEnd,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(service.style.size(30)),
                    topLeft: Radius.circular(service.style.size(30))),
                child: Container(
                    padding: EdgeInsets.only(top: service.style.size(16)),
                    color: Colors.white,
                    child: Column(children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                          onTap: () => collapsed ? _expand() : _collapse(),
                          child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 35),
                          child: Image.asset(
                                  "res/images/" +
                                      (collapsed ? "arrow_up" : "arrow_down") +
                                      ".png",
                                  package: "money"))),
                      const MoneyHomeViewHeader(),
                      MoneyHomeViewList(
                          transactions: widget.transactions,
                          example: widget.example,
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
      heightFactor = 0.70;
    });
  }

  _expand() {
    setState(() {
      collapsed = false;
      heightFactor = 0.4;
    });
  }

  void _scrollListener() {
    if (collapsed) _expand();
    if (_scrollController.offset <= 1 &&
        !_scrollController.position.outOfRange &&
        !collapsed) _collapse();
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../money_service.dart';
import 'money_home_view_header.dart';
import 'money_home_view_list.dart';

class MoneyHomeBottomSheet extends StatefulWidget {

  final bool example;

  const MoneyHomeBottomSheet({Key? key, this.example = false}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MoneyBottomSheet();
}

class _MoneyBottomSheet extends State<MoneyHomeBottomSheet>{

  late ScrollController _scrollController;
  double heightFactor = 0.4;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    double height = MediaQuery.of(context).size.height * heightFactor;
    return AnimatedSize(
        curve: Curves.easeIn,
        duration: const Duration(seconds: 1),
        child: SizedBox(
          height: height,
          child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(service.style.size(30))),
                    child: Column( children: [
                        const MoneyHomeViewHeader(),
                        MoneyHomeViewList(example: widget.example, scrollController: _scrollController),
                  ]))));
  }

  void _scrollListener() {
    if(_scrollController.position.pixels > _scrollController.position.minScrollExtent){
      setState(() {
        heightFactor = 0.85;
      });
    }
    if (_scrollController.offset <= _scrollController.position.minScrollExtent &&
        !_scrollController.position.outOfRange) {
      setState(() {
        heightFactor = 0.4;
      });
    }
  }
}

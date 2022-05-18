/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import '../nft_detail/nft_detail_model.dart';
import '../nft_detail/nft_detail_service.dart';
import 'nft_history_service.dart';

class NFTHistoryController {
  late final ScrollController scrollController;
  final NFTHistoryService _service;

  NFTHistoryController(this._service) {
    scrollController = ScrollController()..addListener(onScroll);
  }

  Future<void> openDetail(BuildContext context, NFTDetailModel nft) =>
      NFTDetailService(nft).presenter.open(context);

  void onVerticalDragEnd(DragEndDetails details) =>
      details.velocity.pixelsPerSecond.dy > 0
          ? _service.tryCollapse(true)
          : _service.tryCollapse(false);

  void onScroll() {
    if (scrollController.position.atEdge &&
        scrollController.position.userScrollDirection ==
            ScrollDirection.reverse) {
      _service.nextPage();
    } else if (scrollController.position.outOfRange &&
        scrollController.offset < 0) {
      _service.tryCollapse(true);
    } else if (scrollController.offset > 0) {
      _service.tryCollapse(false);
    }
  }
}

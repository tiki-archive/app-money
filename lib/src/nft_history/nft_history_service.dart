/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:tiki_localgraph/tiki_localgraph.dart';
import 'package:tiki_wallet/tiki_wallet.dart';

import '../../tiki_money.dart';
import '../nft_detail/nft_detail_model.dart';
import 'nft_history_controller.dart';
import 'nft_history_model.dart';
import 'nft_history_presenter.dart';

class NFTHistoryService extends ChangeNotifier {
  static const _edgeTypeOccurrence = 'occurrence';

  final NFTHistoryModel model = NFTHistoryModel();
  late final NFTHistoryPresenter presenter;
  late final NFTHistoryController controller;

  final TikiLocalGraph _localGraph;
  final TikiChainService _chainService;

  NFTHistoryService(this._localGraph, this._chainService) {
    presenter = NFTHistoryPresenter(this);
    controller = NFTHistoryController(this);
    load();
  }

  Future<void> load() async {
    List<NFTDetailModel> loaded = await _lookup();
    if (model.nfts.isEmpty ||
        loaded.elementAt(0).hash != model.nfts.elementAt(0).hash) {
      model.nfts = loaded;
      notifyListeners();
    }
  }

  Future<void> nextPage() => page(model.page + 1);

  Future<void> page(int page) async {
    List<NFTDetailModel> loaded = await _lookup(page: page);
    if (loaded.isNotEmpty) {
      model.page = page;
      model.nfts.addAll(loaded);
      notifyListeners();
    }
  }

  void tryCollapse(bool isCollapsed) {
    if (model.isCollapsed != isCollapsed) {
      model.isCollapsed = isCollapsed;
      notifyListeners();
    }
  }

  Future<List<NFTDetailModel>> _lookup({int? page}) async {
    List<EdgeModel> edges = await _localGraph.latest(page ?? model.page);
    List<TikiChainBlock> blocks =
        await _chainService.read(edges.map((e) => e.nft!).toList());

    Map<String, EdgeModel> edgeMap =
        Map.fromEntries(edges.map((e) => MapEntry(base64Encode(e.nft!), e)));

    return blocks.map((block) {
      String hashB64 = base64Encode(block.hash!);
      EdgeModel? edge = edgeMap[hashB64];

      VertexModel? notOcc = edge?.v1;
      if (edge?.v1?.type == _edgeTypeOccurrence) notOcc = edge?.v2;

      return NFTDetailModel(
        hash: hashB64,
        type: NFTDetailModelTypeExt.fromString(notOcc?.type),
        value: notOcc?.value,
        fingerprint: edge?.fingerprint,
        minted: block.created,
        synced: block.synced,
        listed: edge?.pushed,
      );
    }).toList();
  }
}

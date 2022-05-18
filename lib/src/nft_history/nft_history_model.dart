/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import '../nft_detail/nft_detail_model.dart';

class NFTHistoryModel {
  bool isCollapsed;
  int page = 1;
  List<NFTDetailModel> nfts;

  NFTHistoryModel({this.isCollapsed = true, this.nfts = const []});
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/cupertino.dart';

import '../dnft/dnft_model.dart';
import 'dnft_list_controller.dart';
import 'dnft_list_model.dart';
import 'dnft_list_presenter.dart';

class DNFTListService extends ChangeNotifier {
  late final DNFTListPresenter presenter;
  late final DNFTListController controller;
  late final DNFTListModel model;

  DNFTListService({bool? example}) {
    presenter = DNFTListPresenter(this, example: example);
    controller = DNFTListController(this);
    model = DNFTListModel();
  }

  void pushTransactions(List<DNFTModel> nfts, {required bool overwrite}) {
    if (!overwrite) {
      model.nfts = [...nfts, ...model.nfts];
    } else {
      model.nfts = nfts;
    }
    notifyListeners();
  }
}

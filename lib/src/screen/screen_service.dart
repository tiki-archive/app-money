import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../card/card_service.dart';
import '../nft_history/nft_history_service.dart';
import 'screen_presenter.dart';

class ScreenService extends ChangeNotifier {
  final Logger _log = Logger('ScreenService');

  late final ScreenPresenter presenter;

  ScreenService({CardService? card, NFTHistoryService? history}) {
    presenter = ScreenPresenter(this,
        card: card?.presenter.widget, history: history?.presenter.widget);
  }
}

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../card/card_service.dart';
import '../dnft_list/dnft_list_service.dart';
import 'screen_presenter.dart';

class ScreenService extends ChangeNotifier {
  final Logger _log = Logger('ScreenService');

  late final ScreenPresenter presenter;
  late final CardService cardService;
  late final DNFTListService listService;

  ScreenService({int referralCount = 0, bool example = false}) {
    presenter = ScreenPresenter(this);
    cardService = CardService(referralCount: referralCount);
    listService = DNFTListService(example: example);
  }
}

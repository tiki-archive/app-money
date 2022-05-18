import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'screen_service.dart';
import 'screen_view_layout.dart';

class ScreenPresenter {
  final ScreenService service;
  final Widget? card;
  final Widget? history;

  ScreenPresenter(this.service, {this.card, this.history});

  ChangeNotifierProvider<ScreenService> get screen =>
      ChangeNotifierProvider.value(
          value: service,
          child: ScreenViewLayout(card: card, history: history));
}

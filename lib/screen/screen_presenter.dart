import 'package:provider/provider.dart';

import 'screen_service.dart';
import 'screen_view_layout.dart';

class ScreenPresenter {
  final ScreenService service;

  ScreenPresenter(this.service);

  ChangeNotifierProvider<ScreenService> get screen =>
      ChangeNotifierProvider.value(
          value: service,
          child: ScreenViewLayout(service.cardService.presenter.widget,
              service.listService.presenter.widget));
}

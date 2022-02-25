import 'package:money/src/model/money_model_transaction.dart';
import 'package:provider/provider.dart';

import '../../src/money_service.dart';
import 'ui/money_home_layout.dart';

class MoneyPresenter {
  final MoneyService service;

  MoneyPresenter(this.service);

  ChangeNotifierProvider<MoneyService> home() {
    return ChangeNotifierProvider.value(
        value: service, child: const MoneyHomeLayout());
  }

  void openDetail(MoneyModelTransaction transaction) {}

}

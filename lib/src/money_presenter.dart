import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:style/style.dart';

import '../../src/money_service.dart';
import 'model/money_model_transaction.dart';
import 'ui/detail/money_detail_layout.dart';
import 'ui/money_home_layout.dart';

class MoneyPresenter {
  final MoneyService service;

  MoneyPresenter(this.service);

  ChangeNotifierProvider<MoneyService> home({bool example = false}) {
    return ChangeNotifierProvider.value(
        value: service, child: MoneyHomeLayout(example: example));
  }

  Future<void> openDetail(
      BuildContext context, MoneyModelTransaction transaction) {
    return showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: ColorProvider.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(SizeProvider.instance.size(36)))),
        builder: (BuildContext context) => ChangeNotifierProvider.value(
            value: service,
            child: MoneyDetailLayout(transaction: transaction)));
  }
}

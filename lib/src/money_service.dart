import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:httpp/httpp.dart';
import 'package:logging/logging.dart';

import 'model/money_model.dart';
import 'model/money_model_transaction.dart';
import 'model/money_model_transaction_type.dart';
import 'money_controller.dart';
import 'money_presenter.dart';
import 'money_signup_repository.dart';

class MoneyService extends ChangeNotifier {
  final Logger _log = Logger('MoneyService');

  late final MoneyModel model;
  late final MoneyPresenter presenter;
  late final MoneyController controller;
  late final MoneySignupRepository moneySignupRepository;

  MoneyService(
      {required Httpp httpp, String? referalCode}) {
    presenter = MoneyPresenter(this);
    model = MoneyModel();
    controller = MoneyController(this);
    if (referalCode != null) {
      _getBalance(referalCode, httpp);
    }
  }

  List<MoneyModelTransaction> generateList() {
    DateTime lastDate = DateTime.now();
    return List.generate(100, (index) {
      List<String> units = ['μ¢', 'n¢'];
      MoneyModelTransactionType type = MoneyModelTransactionType
          .values[Random().nextInt(MoneyModelTransactionType.values.length)];
      String id = '0x' +
          base64Url.encode(
              List<int>.generate(32, (i) => Random.secure().nextInt(256)));
      String fingerprint = base64Url
          .encode(List<int>.generate(10, (i) => Random.secure().nextInt(256)));
      DateTime minted = lastDate.subtract(Duration(
          seconds: index * Random().nextInt(Duration.secondsPerDay ~/ 8)));
      lastDate = minted;
      DateTime? backed = index > 3
          ? minted.add(Duration(
              seconds: index * Random().nextInt(Duration.secondsPerHour)))
          : null;
      DateTime? listed = index > 7
          ? backed?.add(Duration(
              seconds: index * Random().nextInt(Duration.secondsPerHour)))
          : null;
      return MoneyModelTransaction(
          type: type,
          id: id,
          minted: minted,
          backedUp: backed,
          listedOn: listed,
          fingerprint: fingerprint,
          subject: type == MoneyModelTransactionType.subject
              ? 'Build & embed ML models into edge devices? Do it for free!'
              : Random().nextInt(99999).toString().padLeft(5, '1'),
          unit: units[Random().nextInt(100) % 2],
          ammount: "${Random().nextInt(10)}.${Random().nextInt(100)}");
    });
  }

  Future _getBalance(String referalCode, Httpp httpp) async {
    await MoneySignupRepository.total(referalCode, httpp.client(), (count) {
      model.balance = count != null ? 5.0 * (count ~/ 10.0) : 0;
      notifyListeners();
    }, (error) => _log.warning(error));
  }
}

import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../transaction/model/money_model_transaction.dart';
import '../transaction/model/money_model_transaction_type.dart';
import 'presenter.dart';

class StatementService extends ChangeNotifier{

  late final StatementPresenter presenter;

  StatementService() {
    presenter = StatementPresenter(this);
  }

  List<TransactionModel> getTransactions() {
    DateTime lastDate = DateTime.now();
    return List.generate(100, (index) {
      List<String> units = ['μ¢', 'n¢'];
      TransactionType type = TransactionType.values[Random().nextInt(TransactionType.values.length)];
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
      return TransactionModel(
          type: type,
          id: id,
          minted: minted,
          backedUp: backed,
          listedOn: listed,
          fingerprint: fingerprint,
          subject: type == TransactionType.subject
              ? 'Build & embed ML models into edge devices? Do it for free!'
              : Random().nextInt(99999).toString().padLeft(5, '1'),
          unit: units[Random().nextInt(100) % 2],
          ammount: "${Random().nextInt(10)}.${Random().nextInt(100)}");
    });
  }
}
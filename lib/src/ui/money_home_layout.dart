import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:money/src/model/money_model_transaction.dart';
import 'package:money/src/model/money_model_transaction_type.dart';
import 'package:money/src/money_service.dart';
import 'package:money/src/ui/money_home_view_header.dart';
import 'package:provider/provider.dart';

import 'money_home_view_list.dart';

class MoneyHomeLayout extends StatelessWidget {

  final bool example;

  const MoneyHomeLayout({Key? key, this.example = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    List<MoneyModelTransaction> transactionList = 
      example ? _generateList() : service.model.transactions;
    return Column(children: [
      const MoneyHomeViewHeader(),
      MoneyHomeViewList(list: transactionList, example: example),
    ]);
  }

  List<MoneyModelTransaction> _generateList() {
    DateTime lastDate = DateTime.now();
    return List.generate(100, (index) {
      List<String> units = ['μ¢','n¢'];
      String id = '0x' + base64Url.encode(List<int>.generate(32, (i) => Random.secure().nextInt(256)));
      String fingerprint = base64Url.encode(List<int>.generate(10, (i) => Random.secure().nextInt(256)));
      DateTime minted = lastDate.subtract(
          Duration(seconds: index *
              Random().nextInt(Duration.secondsPerDay ~/ 8)));
      lastDate = minted;
      DateTime? backed = index > 3 ? minted.add(Duration(seconds: index *
          Random().nextInt(Duration.secondsPerHour))) : null;
      DateTime? listed = index > 7 ? backed?.add(Duration(seconds: index *
          Random().nextInt(Duration.secondsPerHour))) : null;
      return MoneyModelTransaction(
          type: MoneyModelTransactionType.values[Random().nextInt(MoneyModelTransactionType.values.length)],
          id: id,
          minted: minted,
          backedUp: backed,
          listedOn: listed,
          fingerprint: fingerprint,
          subject: 'Build & embed ML models into edge devices? Do it for free!',
          unit: units[Random().nextInt(100)%2],
          ammount: "${Random().nextInt(10)}.${Random().nextInt(100)}"
      );
    });
  }
}

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tiki_money/tiki_money.dart';
import 'package:tiki_money/transaction/model/money_model_transaction_type.dart';
import 'package:tiki_style/tiki_style.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  MyApp({Key? key}) : super(key: key);

  final List<TransactionModel> transactions = _getTransactions();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.grey,
            appBar: AppBar(
              title: const Text('Money example app'),
            ),
            body: Builder(builder: (context) {
              TikiStyle.init(context);
              return TikiMoney(
                  transactions: widget.transactions,
                  referalCount: 10).screen(example: true);
              })));
  }

}

List<TransactionModel> _getTransactions() {
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
    DateTime? listed = index > 3
        ? minted.add(Duration(
        seconds: index * Random().nextInt(Duration.secondsPerHour)))
        : null;
    DateTime? backed = index > 7
        ? listed?.add(Duration(
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

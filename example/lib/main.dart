import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:money/money.dart';
import 'package:money/src/model/money_model_transaction.dart';
import 'package:money/src/model/money_model_transaction_type.dart';
import 'package:tiki_style/tiki_style.dart';

void main({List<MoneyModelTransaction> transactions = const [], }) {
  runApp(MyApp(transactions: transactions));
}

class MyApp extends StatefulWidget {

  // I know this is not good practice but this is a temporary test that will be
  // replaced once we actually have data NFTs so seems a waste of time to make
  // my own transaction format here that Money parses into correct format.
  List<MoneyModelTransaction> transactions;

  MyApp({Key? key, this.transactions = const []}) : super(key: key) {
    //
    // transactions = [];
    //
    // DateTime lastDate = DateTime.now();
    //
    // String id = '0x' + base64Url.encode(List<int>.generate(32, (i) => Random.secure().nextInt(256)));
    //
    // print("ID: " + id);
    //
    // MoneyModelTransaction t = MoneyModelTransaction(
    //     type: MoneyModelTransactionType.subject,
    //     id: id,
    //     minted: lastDate,
    //     backedUp: lastDate,
    //     listedOn: lastDate,
    //     fingerprint: 'fingerprint',
    //     subject: 'Subject!',
    //     unit: 'μ¢',
    //     ammount: "10");
    //
    // transactions.add(t);
  }

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
              // $001NZ
              return Money(referalCode: '\$001NZ').home(transactions: widget.transactions);
              })));
  }


}

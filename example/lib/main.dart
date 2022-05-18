import 'package:flutter/material.dart';
import 'package:httpp/httpp.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';
import 'package:tiki_kv/tiki_kv.dart';
import 'package:tiki_localgraph/tiki_localgraph.dart';
import 'package:tiki_money/tiki_money.dart';
import 'package:tiki_style/tiki_style.dart';
import 'package:tiki_wallet/tiki_wallet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Httpp httpp = Httpp();
  Database database = await openDatabase('tiki_data_test.db');
  TikiKv tikiKv = await TikiKv(database: database).init();

  TikiKeysModel keys = await TikiKeysService().generate();
  TikiChainService chainService = await TikiChainService(keys).open(
      database: database, kv: tikiKv, httpp: httpp, accessToken: accessToken);

  TikiLocalGraph localGraph = await TikiLocalGraph(chainService)
      .open(database, httpp: httpp, accessToken: accessToken);

  runApp(MaterialApp(
    title: 'Money Example',
    theme: ThemeData(),
    home: Scaffold(
      body: Center(
          child: Widgety(TikiMoney(
              localGraph: localGraph,
              chainService: chainService,
              referralCount: 5))),
    ),
  ));
}

class Widgety extends StatelessWidget {
  final TikiMoney tikiMoney;

  Widgety(this.tikiMoney);

  @override
  Widget build(BuildContext context) {
    TikiStyle style = TikiStyle.init(context);
    return tikiMoney.screen;
  }
}

String accessToken() {
  return '';
}

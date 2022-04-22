import 'package:flutter/material.dart';
import 'package:money/money.dart';
import 'package:style/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
              Style.init(context);
              return Money(referalCode: '\$001NZ').home(example: true);
              })));
  }


}

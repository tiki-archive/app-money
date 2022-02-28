import 'package:flutter/cupertino.dart';
import 'package:money/src/model/money_model_transaction.dart';

import 'money_home_view_list_date.dart';
import 'money_home_view_list_transaction.dart';

class MoneyHomeViewList extends StatelessWidget {

  final List<MoneyModelTransaction> list;
  final bool example;

  const MoneyHomeViewList({Key? key, required this.list, this.example = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Opacity(
        opacity: example ? 0.5 : 1,
        child: Stack(children: [
          SizedBox(height: double.infinity, child: Image.asset('res/images/EXAMPLE.png', package: 'money', repeat: ImageRepeat.noRepeat, alignment: Alignment.center,)),
        ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
      return Column(children: [
        MoneyHomeViewListDate(current: list[index], last: index > 0 ? list[index-1] : null),
        MoneyHomeViewListTransaction( transaction: list[index])
      ]);
    })])));
  }

}
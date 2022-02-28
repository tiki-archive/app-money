import 'package:flutter/cupertino.dart';
import 'package:money/src/model/money_model_transaction.dart';
import 'package:provider/provider.dart';

import '../money_service.dart';
import 'money_home_view_list_date.dart';
import 'money_home_view_list_transaction.dart';

class MoneyHomeViewList extends StatelessWidget {

  final bool example;

  final ScrollController scrollController;

  const MoneyHomeViewList({Key? key, this.example = false, required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    List<MoneyModelTransaction> list = example ? service.generateList() : service.model.transactions;
    return Expanded(
        child: Opacity(
            opacity: example ? 0.5 : 1,
            child: Stack(children: [
              SizedBox(
                  height: double.infinity,
                  child: Image.asset(
                    'res/images/EXAMPLE.png',
                    package: 'money',
                    repeat: ImageRepeat.noRepeat,
                    alignment: Alignment.center,
                  )),
              ListView.builder(
                  controller: scrollController,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      MoneyHomeViewListDate(
                          current: list[index],
                          last: index > 0 ? list[index - 1] : null),
                      MoneyHomeViewListTransaction(transaction: list[index])
                    ]);
                  })
            ])));
  }
}

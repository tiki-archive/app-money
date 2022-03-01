import 'package:flutter/cupertino.dart';
import 'package:money/src/model/money_model_transaction.dart';

import 'money_home_view_list_date.dart';
import 'money_home_view_list_transaction.dart';

class MoneyHomeViewList extends StatelessWidget {
  final bool example;
  final List<MoneyModelTransaction> transactions;
  final ScrollController scrollController;
  final Function? onRefresh;

  const MoneyHomeViewList(
      {Key? key,
      this.onRefresh,
      this.example = false,
      required this.scrollController,
      required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: example ? 0.5 : 1,
        child: Stack(children: [
          Align(
              child: Image.asset(
            'res/images/EXAMPLE.png',
            package: 'money',
            repeat: ImageRepeat.noRepeat,
            alignment: Alignment.center,
          )),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      MoneyHomeViewListDate(
                          current: transactions[index],
                          last: index > 0 ? transactions[index - 1] : null),
                      MoneyHomeViewListTransaction(
                          transaction: transactions[index])
                    ]);
                  }))
        ]));
  }
}

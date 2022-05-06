import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../../transaction/model/money_model_transaction.dart';
import '../../transaction/ui/transaction.dart';
import '../service.dart';
import 'list_date.dart';

class StatementList extends StatelessWidget {
  final bool example;
  final ScrollController scrollController;
  final Function? onRefresh;

  const StatementList(
      {Key? key,
      this.onRefresh,
      this.example = false,
      required this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    StatementService service = Provider.of<StatementService>(context);
    List<TransactionModel> transactions = service.getTransactions();
    return Opacity(
        opacity: example ? 0.5 : 1,
        child: Stack(children: [
          Align(
              child: ImgProvider.example),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return Column(children: [
                      ListDate(
                          current: transactions[index],
                          last: index > 0 ? transactions[index - 1] : null),
                      ListTransaction(
                          transaction: transactions[index])
                    ]);
                  }))
        ]));
  }
}

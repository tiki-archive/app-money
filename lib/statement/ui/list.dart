import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../../transaction/model/money_model_transaction.dart';
import '../service.dart';
import 'list_item.dart';

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
    List<TransactionModel> transactions = service.transactions;
    return Opacity(
        opacity: example ? 0.5 : 1,
        child: Stack(children: [
          example ? Align(alignment: Alignment.center,child: ImgProvider.example) : Container(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: SizeProvider.instance.width(24)),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: transactions.length,
                  itemBuilder: (context, index) =>
                    StatementListItem(
                      current : transactions[index],
                      previous : index > 0 ? transactions[index - 1] : null)
                    ))
        ]));
  }
}

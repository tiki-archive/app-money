import 'package:flutter/cupertino.dart';

import '../../transaction/model/money_model_transaction.dart';
import '../../transaction/service.dart';
import 'list_date.dart';

class StatementListItem extends StatelessWidget{

  final TransactionModel current;
  final TransactionModel? previous;

  const StatementListItem({Key? key, required this.current, this.previous}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionService transactionService = TransactionService(current);
    return Column(children: [
      ListDate(
          current: current,
          previous: previous),
      transactionService.presenter.item()
    ]);
  }

}
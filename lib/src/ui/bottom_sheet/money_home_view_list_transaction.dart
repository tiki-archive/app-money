import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/money_model_transaction.dart';
import '../../model/money_model_transaction_type.dart';
import '../../money_service.dart';

class MoneyHomeViewListTransaction extends StatelessWidget {
  final MoneyModelTransaction transaction;

  const MoneyHomeViewListTransaction({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: service.style.size(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: service.style.size(60),
                  height: service.style.size(30),
                  child: Image.asset("res/images/${transaction.type.icon}.png",
                      height: service.style.size(23), package: "money")),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(children: [
                      Text(transaction.id.substring(0, 9),
                          style: TextStyle(
                              color: service.style.textColor,
                              fontSize: service.style.text(15))),
                      Padding(
                          padding:
                              EdgeInsets.only(left: service.style.size(5))),
                      transaction.listedOn != null
                          ? Image.asset("res/images/double-check.png",
                              package: "money")
                          : transaction.backedUp != null
                              ? Image.asset("res/images/single-check.png",
                                  package: "money")
                              : Container(),
                    ]),
                    Text(transaction.type.asString(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.grey)),
                  ])),
              Padding(
                  padding: EdgeInsets.only(right: service.style.size(7)),
                  child: Text("${transaction.ammount} ${transaction.unit}",
                      style: TextStyle(fontSize: service.style.text(18)))),
            ],
          )),
      onTap: () => service.controller.openDetail(context, transaction),
      behavior: HitTestBehavior.opaque,
    );
  }
}

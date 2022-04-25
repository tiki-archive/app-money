import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:style/style.dart';

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
          padding: EdgeInsets.symmetric(vertical: SizeProvider.instance.size(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: SizeProvider.instance.size(60),
                  height: SizeProvider.instance.size(30),
                  child: Icon(transaction.type.icon,
                      size: SizeProvider.instance.size(23), color: ColorProvider.yellow)),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(children: [
                      Text(transaction.id.substring(0, 9),
                          style: TextStyle(
                              color: ColorProvider.tikiBlue,
                              fontSize: SizeProvider.instance.text(15))),
                      Padding(
                          padding:
                              EdgeInsets.only(left: SizeProvider.instance.size(5))),
                      transaction.listedOn != null
                          ?  Icon(IconProvider.single_check,color: ColorProvider.green, size: SizeProvider.instance.text(12))
                          : transaction.backedUp != null
                              ?  Icon(IconProvider.double_check,color: ColorProvider.green, size: SizeProvider.instance.text(12))
                              : Container(),
                    ]),
                    Text(transaction.type.asString(),
                        textAlign: TextAlign.start,
                        style: const TextStyle(color: Colors.grey)),
                  ])),
              Padding(
                  padding: EdgeInsets.only(right: SizeProvider.instance.size(7)),
                  child: Text("${transaction.ammount} ${transaction.unit}",
                      style: TextStyle(fontSize: SizeProvider.instance.text(18)))),
            ],
          )),
      onTap: () => service.controller.openDetail(context, transaction),
      behavior: HitTestBehavior.opaque,
    );
  }
}

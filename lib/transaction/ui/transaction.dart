import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../model/money_model_transaction.dart';
import '../model/money_model_transaction_type.dart';
import '../service.dart';

class MoneyTransactionItem extends StatelessWidget {

  const MoneyTransactionItem({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TransactionService service = Provider.of<TransactionService>(context);
    TransactionModel transaction = service.transaction;
    return GestureDetector(
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: SizeProvider.instance.size(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: SizeProvider.instance.size(50),
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
                              fontFamily: TextProvider.familyNunitoSans,
                              package: 'tiki_style',
                              height:1.2,
                              color: ColorProvider.tikiBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeProvider.instance.text(15))),
                      Padding(
                          padding:
                              EdgeInsets.only(left: SizeProvider.instance.size(5))),
                      transaction.listedOn != null
                          ?  Icon(IconProvider.check_double,color: ColorProvider.green, size: SizeProvider.instance.text(12))
                          : transaction.backedUp != null
                            ?  Icon(IconProvider.check,color: ColorProvider.green, size: SizeProvider.instance.text(12))
                            : Container(),
                    ]),
                    Text(transaction.type.asString(),
                        textAlign: TextAlign.start,
                        style: TextStyle(color: ColorProvider.greyFour,
                          fontFamily: TextProvider.familyNunitoSans,
                          fontWeight: FontWeight.w600,
                          package: 'tiki_style',
                          height:1.2,
                          fontSize: SizeProvider.instance.text(12),

                        )),
                  ])),
              Padding(
                  padding: EdgeInsets.only(right: SizeProvider.instance.size(7)),
                  child: Text("${transaction.ammount} ${transaction.unit}",
                      style: TextStyle(
                          color: ColorProvider.tikiBlue,
                          fontFamily: TextProvider.familyNunitoSans,
                          package: 'tiki_style',
                          fontWeight: FontWeight.w600,
                          height:1.2,
                          fontSize: SizeProvider.instance.text(18)))),
            ],
          )),
      onTap: () => service.controller.openDetail(context),
      behavior: HitTestBehavior.opaque,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:money/src/model/money_model_transaction.dart';
import 'package:money/src/model/money_model_transaction_type.dart';
import 'package:money/src/money_service.dart';
import 'package:provider/provider.dart';

class MoneyDetailViewContentHeader extends StatelessWidget {
  final MoneyModelTransaction transaction;

  const MoneyDetailViewContentHeader({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return Container(
        padding: EdgeInsets.only(
            top: service.style.size(25),
            bottom: service.style.size(8),
            left: service.style.size(16),
            right: service.style.size(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: service.style.size(16)),
                child: CircleAvatar(
                    radius: service.style.size(70),
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                        radius: service.style.size(68),
                        backgroundColor: Colors.amberAccent,
                        child: Image.asset(
                            "res/images/${transaction.type.icon}-big.png",
                            package: "money")))),
            Padding(
              padding: EdgeInsets.only(bottom: service.style.size(16)),
              child: Text("${transaction.unit} ${transaction.ammount}",
                      style: TextStyle(
                        color: service.style.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: service.style.text(30),
                        fontFamily: 'Koara',
                        package: 'money'
                      )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: service.style.size(16)),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "Subject: ",
                      style: TextStyle(
                        color: service.style.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: service.style.text(12),
                      ),
                      children: [
                        TextSpan(
                          text: transaction.subject,
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        )
                      ])),
            )
          ],
        ));
  }
}

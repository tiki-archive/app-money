import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money/src/model/money_model_transaction.dart';
import 'package:money/src/money_service.dart';
import 'package:provider/provider.dart';

class MoneyDetailViewContentTable extends StatelessWidget {
  final MoneyModelTransaction transaction;

  const MoneyDetailViewContentTable({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: service.style.textColor),
          borderRadius: BorderRadius.all(
            Radius.circular(service.style.size(8)),
          ),
        ),
        child: Table(
          columnWidths: <int, TableColumnWidth>{
            0: FixedColumnWidth(service.style.size(90)),
            1: const FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.symmetric(
              inside: BorderSide(
                  width: service.style.size(1),
                  color: service.style.textColor)),
          children: [
            TableRow(children: [
              const TableCell(
                  child: Text(
                "ID (Hash)",
                textAlign: TextAlign.center,
              )),
              TableCell(
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: service.style.size(8),
                          top: service.style.size(8),
                          bottom: service.style.size(8)),
                      child: Text(transaction.id.substring(0, 10)))),
            ]),
            TableRow(children: [
              const TableCell(
                  child: Text(
                "Minted",
                textAlign: TextAlign.center,
              )),
              TableCell(
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: service.style.size(8),
                          top: service.style.size(8),
                          bottom: service.style.size(8)),
                      child:
                        Text(DateFormat('MMM dd, y H:mm:s')
                            .format(transaction.minted))
                      )),
            ]),
            transaction.backedUp != null
                ? TableRow(children: [
                    const TableCell(
                        child: Text(
                      "Backed Up",
                      textAlign: TextAlign.center,
                    )),
                    TableCell(
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: service.style.size(8),
                                top: service.style.size(8),
                                bottom: service.style.size(8)),
                            child: Row(children: [
                              Text(DateFormat('MMM dd, y H:mm:s')
                                  .format(transaction.backedUp!)),
                              Padding(padding: EdgeInsets.only(left: service.style.text(12)),),
                              Image.asset('res/images/single-check.png',
                                  package: 'money')
                            ]))),
                  ])
                : TableRow(children: [
                    TableCell(child: Container()),
                    TableCell(child: Container())
                  ]),
            transaction.listedOn != null
                ? TableRow(children: [
                    const TableCell(
                        child: Text(
                      "Listed on",
                      textAlign: TextAlign.center,
                    )),
              TableCell(
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: service.style.size(8),
                          top: service.style.size(8),
                          bottom: service.style.size(8)),
                      child: Row(children: [
                        Text(DateFormat('MMM dd, y H:mm:s')
                            .format(transaction.listedOn!)),
                        Padding(padding: EdgeInsets.only(left: service.style.text(12)),),
                        Image.asset('res/images/single-check.png',
                            package: 'money')
                      ]))),
            ]) : TableRow(children: [
                    TableCell(child: Container()),
                    TableCell(child: Container())
                  ]),
            TableRow(children: [
              const TableCell(
                  child: Text(
                "Fingerprint)",
                textAlign: TextAlign.center,
              )),
              TableCell(
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: service.style.size(8),
                          top: service.style.size(8),
                          bottom: service.style.size(8)),
                      child: Text(transaction.fingerprint))),
            ]),
          ],
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiki_style/tiki_style.dart';

import '../model/money_model_transaction.dart';


class MoneyTransactionUiTable extends StatelessWidget {
  final TransactionModel transaction;

  const MoneyTransactionUiTable({Key? key, required this.transaction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: ColorProvider.tikiBlue),
          borderRadius: BorderRadius.all(
            Radius.circular(SizeProvider.instance.size(8)),
          ),
        ),
        child: Table(
          columnWidths: <int, TableColumnWidth>{
            0: FixedColumnWidth(SizeProvider.instance.size(90)),
            1: const FlexColumnWidth(),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          border: TableBorder.symmetric(
              inside: BorderSide(
                  width: SizeProvider.instance.size(1),
                  color: ColorProvider.tikiBlue)),
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
                          left: SizeProvider.instance.size(8),
                          top: SizeProvider.instance.size(8),
                          bottom: SizeProvider.instance.size(8)),
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
                          left: SizeProvider.instance.size(8),
                          top: SizeProvider.instance.size(8),
                          bottom: SizeProvider.instance.size(8)),
                      child: Text(DateFormat('MMM dd, y H:mm:s')
                          .format(transaction.minted)))),
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
                                left: SizeProvider.instance.size(8),
                                top: SizeProvider.instance.size(8),
                                bottom: SizeProvider.instance.size(8)),
                            child: Row(children: [
                              Text(DateFormat('MMM dd, y H:mm:s')
                                  .format(transaction.backedUp!)),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: SizeProvider.instance.text(12)),
                              ),
                              Icon(IconProvider.check, color: ColorProvider.green, size: SizeProvider.instance.text(12),)
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
                                left: SizeProvider.instance.size(8),
                                top: SizeProvider.instance.size(8),
                                bottom: SizeProvider.instance.size(8)),
                            child: Row(children: [
                              Text(DateFormat('MMM dd, y H:mm:s')
                                  .format(transaction.listedOn!)),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: SizeProvider.instance.text(12)),
                              ), Icon(IconProvider.check, color: ColorProvider.green, size: SizeProvider.instance.text(12))
                            ]))),
                  ])
                : TableRow(children: [
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
                          left: SizeProvider.instance.size(8),
                          top: SizeProvider.instance.size(8),
                          bottom: SizeProvider.instance.size(8)),
                      child: Text(transaction.fingerprint))),
            ]),
          ],
        ));
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiki_style/tiki_style.dart';

import 'dnft_model.dart';

class DNFTViewWidgetDetail extends StatelessWidget {
  final DNFTModel nft;

  final TextStyle _textStyle = TextStyle(
      fontFamily: TextProvider.familyNunitoSans,
      fontSize: SizeProvider.instance.height(13),
      package: TextProvider.package,
      color: ColorProvider.tikiBlue);

  DNFTViewWidgetDetail({Key? key, required this.nft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: ColorProvider.tikiBlue),
            borderRadius: BorderRadius.all(
                Radius.circular(SizeProvider.instance.size(8)))),
        child: Table(
            columnWidths: <int, TableColumnWidth>{
              0: FixedColumnWidth(SizeProvider.instance.size(90)),
              1: const FlexColumnWidth()
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.symmetric(
                inside: BorderSide(
                    width: SizeProvider.instance.size(1),
                    color: ColorProvider.tikiBlue)),
            children: [
              TableRow(children: [
                TableCell(
                    child: Text('ID (Hash)',
                        textAlign: TextAlign.center, style: _textStyle)),
                TableCell(
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeProvider.instance.size(8),
                            top: SizeProvider.instance.size(8),
                            bottom: SizeProvider.instance.size(8)),
                        child:
                            Text(nft.id.substring(0, 10), style: _textStyle)))
              ]),
              TableRow(children: [
                TableCell(
                    child: Text('Minted',
                        textAlign: TextAlign.center, style: _textStyle)),
                TableCell(
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeProvider.instance.size(8),
                            top: SizeProvider.instance.size(8),
                            bottom: SizeProvider.instance.size(8)),
                        child: Text(
                            DateFormat('MMM dd, y H:mm:s').format(nft.minted),
                            style: _textStyle)))
              ]),
              nft.backedUp != null
                  ? TableRow(children: [
                      TableCell(
                          child: Text('Backed Up',
                              textAlign: TextAlign.center, style: _textStyle)),
                      TableCell(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: SizeProvider.instance.size(8),
                                  top: SizeProvider.instance.size(8),
                                  bottom: SizeProvider.instance.size(8)),
                              child: Row(children: [
                                Text(
                                    DateFormat('MMM dd, y H:mm:s')
                                        .format(nft.backedUp!),
                                    style: _textStyle),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: SizeProvider.instance.text(12))),
                                Icon(IconProvider.check,
                                    color: ColorProvider.green,
                                    size: SizeProvider.instance.text(12))
                              ])))
                    ])
                  : TableRow(children: [
                      TableCell(child: Container()),
                      TableCell(child: Container())
                    ]),
              nft.listedOn != null
                  ? TableRow(children: [
                      TableCell(
                          child: Text('Listed on',
                              textAlign: TextAlign.center, style: _textStyle)),
                      TableCell(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: SizeProvider.instance.size(8),
                                  top: SizeProvider.instance.size(8),
                                  bottom: SizeProvider.instance.size(8)),
                              child: Row(children: [
                                Text(
                                    DateFormat('MMM dd, y H:mm:s')
                                        .format(nft.listedOn!),
                                    style: _textStyle),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: SizeProvider.instance.text(12))),
                                Icon(IconProvider.check,
                                    color: ColorProvider.green,
                                    size: SizeProvider.instance.text(12))
                              ])))
                    ])
                  : TableRow(children: [
                      TableCell(child: Container()),
                      TableCell(child: Container())
                    ]),
              TableRow(children: [
                TableCell(
                    child: Text('Fingerprint',
                        textAlign: TextAlign.center, style: _textStyle)),
                TableCell(
                    child: Padding(
                        padding: EdgeInsets.only(
                            left: SizeProvider.instance.size(8),
                            top: SizeProvider.instance.size(8),
                            bottom: SizeProvider.instance.size(8)),
                        child: Text(nft.fingerprint, style: _textStyle)))
              ])
            ]));
  }
}

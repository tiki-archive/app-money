/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import '../nft_detail/nft_detail_model.dart';
import '../nft_detail/nft_detail_model_type.dart';
import 'nft_history_service.dart';
import 'nft_history_view_widget_date.dart';

class NFTHistoryViewWidgetItem extends StatelessWidget {
  final NFTDetailModel current;
  final NFTDetailModel? previous;

  const NFTHistoryViewWidgetItem(
      {Key? key, required this.current, this.previous})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      NFTHistoryViewWidgetDate(
          current: current.minted, previous: previous?.minted),
      GestureDetector(
        child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeProvider.instance.height(10)),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                  width: SizeProvider.instance.width(50),
                  height: SizeProvider.instance.height(30),
                  child: Icon(current.type?.icon,
                      size: SizeProvider.instance.text(23),
                      color: ColorProvider.yellow)),
              Expanded(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(children: [
                      Text(current.hash?.substring(0, 9) ?? '',
                          style: TextStyle(
                              fontFamily: TextProvider.familyNunitoSans,
                              package: TextProvider.package,
                              height: 1.2,
                              color: ColorProvider.tikiBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: SizeProvider.instance.text(15))),
                      Padding(
                          padding: EdgeInsets.only(
                              left: SizeProvider.instance.width(5))),
                      current.listed != null
                          ? Icon(IconProvider.check_double,
                              color: ColorProvider.green,
                              size: SizeProvider.instance.text(12))
                          : current.synced != null
                              ? Icon(IconProvider.check,
                                  color: ColorProvider.green,
                                  size: SizeProvider.instance.text(12))
                              : Container()
                    ]),
                    Text(current.type?.pretty() ?? '',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: ColorProvider.greyFour,
                          fontFamily: TextProvider.familyNunitoSans,
                          fontWeight: FontWeight.w600,
                          package: TextProvider.package,
                          height: 1.2,
                          fontSize: SizeProvider.instance.text(12),
                        ))
                  ])),
              Padding(
                  padding:
                      EdgeInsets.only(right: SizeProvider.instance.size(7)),
                  child: Text(current.amount,
                      style: TextStyle(
                          color: ColorProvider.tikiBlue,
                          fontFamily: TextProvider.familyNunitoSans,
                          package: TextProvider.package,
                          fontWeight: FontWeight.w600,
                          height: 1.2,
                          fontSize: SizeProvider.instance.text(18))))
            ])),
        onTap: () => Provider.of<NFTHistoryService>(context, listen: false)
            .controller
            .openDetail(context, current),
        behavior: HitTestBehavior.opaque,
      )
    ]);
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'nft_detail_model.dart';
import 'nft_detail_service.dart';

class NFTDetailViewWidgetHeader extends StatelessWidget {
  final NFTDetailModel nft;

  const NFTDetailViewWidgetHeader({Key? key, required this.nft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: SizeProvider.instance.size(24)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () =>
                      Provider.of<NFTDetailService>(context, listen: false)
                          .controller
                          .back(context),
                  child: Container(
                      alignment: Alignment.center,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: SizeProvider.instance.width(25)),
                          child: Center(
                              child: Icon(IconProvider.arrow_left,
                                  color: ColorProvider.greyThree,
                                  size: SizeProvider.instance.text(18)))))),
              Container(
                  alignment: Alignment.center,
                  child: Text('NFT ${nft.hash?.substring(0, 10)}',
                      style: TextStyle(
                          fontFamily: TextProvider.familyNunitoSans,
                          package: TextProvider.package,
                          color: ColorProvider.tikiBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeProvider.instance.text(15)))),
              SizedBox.fromSize(
                  size: Size(SizeProvider.instance.width(40),
                      SizeProvider.instance.size(40)))
            ]));
  }
}

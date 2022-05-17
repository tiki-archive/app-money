/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiki_style/tiki_style.dart';

import 'dnft_model.dart';
import 'dnft_service.dart';

class DNFTViewWidgetHeader extends StatelessWidget {
  final DNFTModel nft;

  const DNFTViewWidgetHeader({Key? key, required this.nft}) : super(key: key);

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
                  onTap: () => Provider.of<DNFTService>(context, listen: false)
                      .controller
                      .back(context),
                  child: Container(
                      alignment: Alignment.center,
                      child: Container(
                          padding: EdgeInsets.only(
                              left: SizeProvider.instance.size(25)),
                          child: Center(
                              child: Icon(IconProvider.arrow_left,
                                  color: ColorProvider.greyThree,
                                  size: SizeProvider.instance.size(18)))))),
              Container(
                  alignment: Alignment.center,
                  child: Text('NFT ${nft.id.substring(0, 10)}',
                      style: TextStyle(
                          fontFamily: TextProvider.familyNunitoSans,
                          package: TextProvider.package,
                          color: ColorProvider.tikiBlue,
                          fontWeight: FontWeight.w600,
                          fontSize: SizeProvider.instance.size(15)))),
              SizedBox.fromSize(
                  size: Size(SizeProvider.instance.size(40),
                      SizeProvider.instance.size(40)))
            ]));
  }
}

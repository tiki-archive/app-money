/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

import 'nft_detail_model.dart';
import 'nft_detail_model_type.dart';

class NFTDetailViewWidgetSummary extends StatelessWidget {
  final NFTDetailModel nft;

  const NFTDetailViewWidgetSummary({Key? key, required this.nft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: SizeProvider.instance.height(25),
            bottom: SizeProvider.instance.height(8),
            left: SizeProvider.instance.width(16),
            right: SizeProvider.instance.width(16)),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding:
                      EdgeInsets.only(bottom: SizeProvider.instance.height(35)),
                  child: Stack(children: [
                    CircleAvatar(
                        radius: SizeProvider.instance.width(54),
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: SizeProvider.instance.width(52),
                          backgroundColor: ColorProvider.yellow,
                        )),
                    SizedBox(
                        width: SizeProvider.instance.size(108),
                        height: SizeProvider.instance.height(108),
                        child: Center(
                            child: Icon(nft.type?.icon,
                                size: SizeProvider.instance.text(35),
                                color: ColorProvider.white)))
                  ])),
              Padding(
                  padding:
                      EdgeInsets.only(bottom: SizeProvider.instance.height(15)),
                  child: Text(nft.amount,
                      style: TextStyle(
                          color: ColorProvider.tikiBlue,
                          fontWeight: FontWeight.bold,
                          fontSize: SizeProvider.instance.text(30),
                          fontFamily: TextProvider.familyKoara,
                          package: TextProvider.package))),
              Padding(
                  padding:
                      EdgeInsets.only(bottom: SizeProvider.instance.size(16)),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: '${nft.type?.pretty()}: ',
                          style: TextStyle(
                            fontFamily: TextProvider.familyNunitoSans,
                            package: TextProvider.package,
                            color: ColorProvider.tikiBlue,
                            fontWeight: FontWeight.w800,
                            fontSize: SizeProvider.instance.text(12),
                          ),
                          children: [
                            TextSpan(
                                text: nft.value,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600))
                          ])))
            ]));
  }
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class NFTHistoryViewExplain extends StatelessWidget {
  final String _title = "Data NFTs are here !!!";
  final String _text = '''
These are very much in beta-beta. 
This is to test for bugs, do not panic
if they don't work right or disappear.
They will all be replaced once the 
bugs are squashed.
''';

  const NFTHistoryViewExplain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontFamily: TextProvider.familyNunitoSans,
                      package: TextProvider.package,
                      color: ColorProvider.tikiBlue,
                      fontSize: SizeProvider.instance.text(18),
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: EdgeInsets.only(
                        bottom: SizeProvider.instance.size(10))),
                Text(_text,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontFamily: TextProvider.familyKoara,
                        color: ColorProvider.tikiBlue,
                        fontSize: SizeProvider.instance.text(13)))
              ]),
          Center(child: ImgProvider.pineapplePizza)
        ]));
  }
}

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';


class StatementUiHeader extends StatelessWidget {
  final String _title = "Data NFTs are on the way!";
  final String _text = '''
We have a few technical i’s to dot and t’s 
to cross but the core tech is in your app. 
Keep your 👀 peeled, your data NFTs will 
start showing up in a couple weeks.
''';

  const StatementUiHeader({Key? key}) : super(key: key);

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
                    fontFamily: TextProvider.familyKoara,
                    package: 'tiki_style',
                    color: ColorProvider.tikiBlue,
                    fontSize: SizeProvider.instance.text(18),
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: SizeProvider.instance.size(10)),
              ),
              Text(
                _text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontFamily: TextProvider.familyKoara,
                  color: ColorProvider.tikiBlue,
                  fontSize: SizeProvider.instance.text(13),
                ),
              )
            ],
          ),
          Center(child: ImgProvider.pineapplePizza)
        ],
      ),
    );
  }
}

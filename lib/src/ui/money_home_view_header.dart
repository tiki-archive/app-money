import 'package:flutter/material.dart';
import 'package:money/src/money_service.dart';
import 'package:provider/provider.dart';

class MoneyHomeViewHeader extends StatelessWidget{

  final String _title = "Data NFTs are on the way!";
  final String _text = '''
  We have a few technical i’s to dot and t’s 
  to cross but the core tech is in your app. 
  Keep your 👀 peeled, your data NFTs will 
  start showing up in a couple weeks.
''';

  const MoneyHomeViewHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MoneyService service = Provider.of<MoneyService>(context);
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Text(_title, style: TextStyle(
                  fontFamily: service.style.headerFontFamily,
                  color: service.style.headerColor,
                  fontSize: service.style.text(18),
                  fontWeight: FontWeight.bold
                ),),
                Text(_text, style: TextStyle(
                    fontFamily: service.style.headerFontFamily,
                    color: service.style.headerColor,
                    fontSize: service.style.text(13),
                ),)
              ],
            ),
          ),
          SizedBox(
            width: service.style.size(70),
            height: service.style.size(100),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "pineapple-pizza",
                package: "money",
                width: service.style.size(68),
                height: service.style.size(98),
              )
            )
          )
        ],
      ),
    );
  }

}
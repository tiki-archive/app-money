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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(_title,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                    fontFamily: service.style.headerFontFamily,
                    color: service.style.headerColor,
                    fontSize: service.style.text(18),
                    fontWeight: FontWeight.bold
                  ),),
                  Padding(padding: EdgeInsets.only(bottom: service.style.size(10)),),
                  Text(_text,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                      fontFamily: service.style.headerFontFamily,
                      color: service.style.headerColor,
                      fontSize: service.style.text(13),
                  ),)
                ],
              ),
          Image.asset(
                "res/images/pineapple-pizza.png",
                package: "money",
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }

}
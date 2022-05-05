import 'package:flutter/cupertino.dart';

class ListService extends ChangeNotifier{


  List<MoneyModelTransaction> generateList() {
    DateTime lastDate = DateTime.now();
    return List.generate(100, (index) {
      List<String> units = ['μ¢', 'n¢'];
      MoneyModelTransactionType type = MoneyModelTransactionType
          .values[Random().nextInt(MoneyModelTransactionType.values.length)];
      String id = '0x' +
          base64Url.encode(
              List<int>.generate(32, (i) => Random.secure().nextInt(256)));
      String fingerprint = base64Url
          .encode(List<int>.generate(10, (i) => Random.secure().nextInt(256)));
      DateTime minted = lastDate.subtract(Duration(
          seconds: index * Random().nextInt(Duration.secondsPerDay ~/ 8)));
      lastDate = minted;
      DateTime? backed = index > 3
          ? minted.add(Duration(
          seconds: index * Random().nextInt(Duration.secondsPerHour)))
          : null;
      DateTime? listed = index > 7
          ? backed?.add(Duration(
          seconds: index * Random().nextInt(Duration.secondsPerHour)))
          : null;
      return MoneyModelTransaction(
          type: type,
          id: id,
          minted: minted,
          backedUp: backed,
          listedOn: listed,
          fingerprint: fingerprint,
          subject: type == MoneyModelTransactionType.subject
              ? 'Build & embed ML models into edge devices? Do it for free!'
              : Random().nextInt(99999).toString().padLeft(5, '1'),
          unit: units[Random().nextInt(100) % 2],
          ammount: "${Random().nextInt(10)}.${Random().nextInt(100)}");
    });
  }
}
import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:money/src/money_service.dart';
import 'package:money/src/model/money_model_transaction.dart';
import 'package:money/src/model/money_model_transaction_type.dart';

import 'package:money_example/main.dart' as app;
import 'package:provider/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Money Integration Test', () {
    testWidgets('Transaction List - Shows Transactions',
        (WidgetTester tester) async {

      DateTime lastDate = DateTime.now();
      String id = '0x' + base64Url.encode(List<int>.generate(32, (i) => Random.secure().nextInt(256)));

      MoneyModelTransaction t = MoneyModelTransaction(
          type: MoneyModelTransactionType.subject,
          id: id,
          minted: lastDate.subtract(Duration(hours: 12)),
          backedUp: lastDate,
          listedOn: lastDate,
          fingerprint: 'fingerprint',
          subject: 'Subject!',
          unit: 'μ¢',
          ammount: "\$10");

      app.main(transactions: [t]);

      await tester.pumpAndSettle();

      // Should see a column for data NFTs
      expect(find.byKey(Key("DataNFTsColumn")), findsOneWidget);

      print("Looking for text w/ " + id.substring(0, 8));

      // Should find the NFT we've created
      Finder dataNFT = find.textContaining(id.substring(0, 8));
      expect(dataNFT, findsOneWidget);

      // tester.tap(dataNFT);
      // await tester.pumpAndSettle();
    });

    testWidgets('Balance Display - Correct Amount',
            (WidgetTester tester) async {

          app.main();

          await tester.pumpAndSettle();

          // Verify balance shows
          expect(find.text('your balance'), findsOneWidget);

          // Should show $0 by default
          expect(find.descendant(
              of: find.byKey(const Key("MoneyHomeViewAmount")),
              matching: find.textContaining("\$0")), findsOneWidget);

          // Now lets set the balance and make sure it displays

          // Get build context
          BuildContext context = tester.element(find.descendant(
              of: find.byKey(Key("MoneyHomeViewAmount")),
              matching: find.textContaining("\$")));

          // Update balance in money service
          MoneyService service = Provider.of<MoneyService>(context, listen: false);
          service.model.balance = 100;
          service.notifyListeners();

          await tester.pumpAndSettle();

          // Now lets find the amount
          expect(find.descendant(
              of: find.byKey(const Key("MoneyHomeViewAmount")),
              matching: find.textContaining("\$100")), findsOneWidget);
        });
  });
}

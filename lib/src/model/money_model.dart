import 'money_model_transaction.dart';

class MoneyModel{
  DateTime start = DateTime.now().subtract(const Duration(days:7));
  DateTime end = DateTime.now();
  List<MoneyModelTransaction> transactions = [];
}
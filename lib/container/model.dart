import '../transaction/model/money_model_transaction.dart';

class ContainerModel{
  DateTime start = DateTime.now().subtract(const Duration(days:7));
  DateTime end = DateTime.now();
  List<TransactionModel> transactions = [];
  double balance = 0;
}
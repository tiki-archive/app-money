
import 'money_model_transaction_type.dart';

class TransactionModel{
  late TransactionType type;
  late String id;
  late DateTime minted;
  late DateTime? backedUp;
  late DateTime? listedOn;
  late String fingerprint;
  late String subject;
  late String unit;
  late String ammount;

  TransactionModel({
    required this.type,
    required this.id,
    required this.minted,
    this.backedUp,
    this.listedOn,
    required this.fingerprint,
    required this.subject,
    required this.unit,
    required this.ammount,
  });
}
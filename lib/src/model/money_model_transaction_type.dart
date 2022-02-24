import 'package:flutter/material.dart';

enum MoneyModelTransactionType{
  subject,
  zipcode
}

extension MoneyModelTransactionTypeExt on MoneyModelTransactionType{
  String asString() {
    String name = toString()
        .split('.')
        .last;
    return name[0].toUpperCase() + name.substring(1);
  }

  IconData get icon {
    switch(this){
      case MoneyModelTransactionType.subject:
        return Icons.mail_outlined;
      case MoneyModelTransactionType.zipcode:
        return Icons.location_on;
    }
  }
}
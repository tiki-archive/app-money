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

  String get icon {
    switch(this){
      case MoneyModelTransactionType.subject:
        return "mail";
      case MoneyModelTransactionType.zipcode:
        return "location";
    }
  }
}
import 'package:flutter/material.dart';
import 'package:style/style.dart';

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
        return IconProvider.mail;
      case MoneyModelTransactionType.zipcode:
        return IconProvider.location;
    }
  }
}
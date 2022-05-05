import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

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
        return IconProvider.email_outline;
      case MoneyModelTransactionType.zipcode:
        return IconProvider.location;
    }
  }
}
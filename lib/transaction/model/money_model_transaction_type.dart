import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

enum TransactionType{
  subject,
  zipcode
}

extension TransactionTypeExt on TransactionType{
  String asString() {
    String name = toString()
        .split('.')
        .last;
    return name[0].toUpperCase() + name.substring(1);
  }

  IconData get icon {
    switch(this){
      case TransactionType.subject:
        return IconProvider.email_solid;
      case TransactionType.zipcode:
        return IconProvider.location;
    }
  }
}
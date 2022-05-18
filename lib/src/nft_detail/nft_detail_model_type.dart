/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

enum NFTDetailModelType { subject, date, action, company }

extension NFTDetailModelTypeExt on NFTDetailModelType {
  String pretty() {
    String name = toString().split('.').last;
    return name[0].toUpperCase() + name.substring(1);
  }

  IconData get icon {
    switch (this) {
      case NFTDetailModelType.subject:
        return IconProvider.email_solid;
      case NFTDetailModelType.action:
        return IconProvider.click_solid;
      case NFTDetailModelType.date:
        return IconProvider.calendar_solid;
      case NFTDetailModelType.company:
        return IconProvider.company_solid;
    }
  }

  static NFTDetailModelType? fromString(String? s) {
    if (s != null) {
      switch (s.toLowerCase()) {
        case 'subject':
          return NFTDetailModelType.subject;
        case 'action':
          return NFTDetailModelType.action;
        case 'date':
          return NFTDetailModelType.date;
        case 'company':
          return NFTDetailModelType.company;
      }
    }
    return null;
  }
}

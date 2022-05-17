/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

enum DNFTModelType { subject, zipcode }

extension DNFTModelTypeExt on DNFTModelType {
  String asString() {
    String name = toString().split('.').last;
    return name[0].toUpperCase() + name.substring(1);
  }

  IconData get icon {
    switch (this) {
      case DNFTModelType.subject:
        return IconProvider.email_solid;
      case DNFTModelType.zipcode:
        return IconProvider.location;
    }
  }
}

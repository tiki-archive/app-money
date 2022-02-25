import 'package:flutter/material.dart';

import 'utils/money_utils_style.dart';

class MoneyStyle extends MoneyUtilsStyle {
  final Color _headerColor;
  final String _headerFontFamily;

  MoneyStyle({
    headerColor = const Color(0xFF00133F),
    headerFontFamily = "Arial"
  }) :
   _headerColor = headerColor,
   _headerFontFamily = headerFontFamily;

  get headerColor => _headerColor;

  get headerFontFamily => _headerFontFamily;
}

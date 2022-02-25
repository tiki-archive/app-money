import 'package:flutter/material.dart';

import 'utils/money_utils_style.dart';

class MoneyStyle extends MoneyUtilsStyle {
  final Color _textColor;
  final String _headerFontFamily;

  MoneyStyle({
    textColor = const Color(0xFF00133F),
    headerFontFamily = "Arial"
  }) :
   _textColor = textColor,
   _headerFontFamily = headerFontFamily;

  get headerColor => _textColor;

  get headerFontFamily => _headerFontFamily;

  get textColor => _textColor;
}

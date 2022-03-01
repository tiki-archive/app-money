import 'package:flutter/material.dart';

import 'utils/money_utils_style.dart';

class MoneyStyle extends MoneyUtilsStyle {
  final Color _textColor;
  final Color _modalNavColor;
  final String _headerFontFamily;

  MoneyStyle({modalNavColor = Colors.white, textColor = const Color(0xFF00133F), headerFontFamily = "Arial"})
      : _textColor = textColor,
        _headerFontFamily = headerFontFamily,
        _modalNavColor = modalNavColor;

  get headerColor => _textColor;

  get headerFontFamily => _headerFontFamily;

  get textColor => _textColor;

  get modalNavColor => _modalNavColor;
}

/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tiki_style/tiki_style.dart';

class NFTHistoryViewWidgetDate extends StatelessWidget {
  final DateTime? current;
  final DateTime? previous;

  const NFTHistoryViewWidgetDate(
      {Key? key, required this.current, this.previous})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return previous == null
        ? Container(
            padding: EdgeInsets.only(top: SizeProvider.instance.height(10)),
            width: double.infinity,
            child: Text(_getDateString(current).toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: SizeProvider.instance.text(15),
                    fontFamily: TextProvider.familyNunitoSans,
                    package: TextProvider.package)))
        : current?.day != previous!.day
            ? Container(
                padding: EdgeInsets.only(top: SizeProvider.instance.height(10)),
                width: double.infinity,
                child: Text(_getDateString(current).toUpperCase(),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: SizeProvider.instance.text(15),
                        fontFamily: TextProvider.familyNunitoSans,
                        package: TextProvider.package)))
            : Container();
  }

  String _getDateString(DateTime? date) {
    if (_isToday(date)) return 'Today';
    if (_isYesterday(date)) return 'Yesterday';
    return DateFormat('EEEE, d MMM').format(date ?? DateTime.now());
  }

  bool _isToday(DateTime? date) {
    DateTime now = DateTime.now();
    return date?.isAfter(now.subtract(Duration(
          hours: now.hour,
          minutes: now.minute,
          seconds: now.second,
          milliseconds: now.millisecond,
          microseconds: now.microsecond,
        ))) ??
        false;
  }

  bool _isYesterday(DateTime? date) {
    DateTime now = DateTime.now();
    return date?.isAfter(now.subtract(Duration(
          hours: now.hour + Duration.hoursPerDay,
          minutes: now.minute,
          seconds: now.second,
          milliseconds: now.millisecond,
          microseconds: now.microsecond,
        ))) ??
        false;
  }
}

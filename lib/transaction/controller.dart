import 'package:flutter/material.dart';

import 'model/money_model_transaction.dart';

import 'service.dart';

class TransactionController{
  TransactionService service;

  TransactionController(this.service);

  openDetail(BuildContext context, TransactionModel transaction) {}
}
import 'package:flutter/material.dart';

import 'service.dart';

class TransactionController{
  TransactionService service;

  TransactionController(this.service);

  Future<void> openDetail(BuildContext context) => service.presenter.openDetail(context);
}
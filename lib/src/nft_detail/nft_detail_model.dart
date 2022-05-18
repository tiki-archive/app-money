/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'nft_detail_model_type.dart';

class NFTDetailModel {
  String? hash;
  NFTDetailModelType? type;
  String? value;
  String? fingerprint;
  DateTime? minted;
  DateTime? synced;
  DateTime? listed;
  double? _amount;

  NFTDetailModel(
      {this.hash,
      this.type,
      this.value,
      this.fingerprint,
      this.minted,
      this.synced,
      this.listed,
      double? amount})
      : _amount = amount;

  String get amount {
    if (_amount == null) {
      return '\$ TBD';
    } else if (_amount! > 0.01) {
      return '${(_amount! / 0.01).toStringAsFixed(2)} ¢';
    } else if (_amount! > 0.001) {
      return '${(_amount! / 0.001).toStringAsFixed(2)} m¢';
    } else if (_amount! > 0.000001) {
      return '${(_amount! / 0.000001).toStringAsFixed(2)} u¢';
    } else if (_amount! > 0.000000001) {
      return '${(_amount! / 0.001).toStringAsFixed(2)} n¢';
    } else {
      return '${(_amount! / 0.000000000001).toStringAsFixed(2)} p¢';
    }
  }
}

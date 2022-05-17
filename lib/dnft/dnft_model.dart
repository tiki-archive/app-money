/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'dnft_model_type.dart';

class DNFTModel {
  DNFTModelType type;
  String id;
  DateTime minted;
  DateTime? backedUp;
  DateTime? listedOn;
  String fingerprint;
  String subject;
  String unit;
  String amount;

  DNFTModel({
    required this.type,
    required this.id,
    required this.minted,
    this.backedUp,
    this.listedOn,
    required this.fingerprint,
    required this.subject,
    required this.unit,
    required this.amount,
  });
}

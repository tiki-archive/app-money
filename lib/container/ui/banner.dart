/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ContainerHomeViewBanner extends StatelessWidget {
  const ContainerHomeViewBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ImgProvider.refOnlyBanner,
      height: SizeProvider.instance.size(80),
    );
  }
}

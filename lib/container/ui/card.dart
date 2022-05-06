/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */
import 'package:flutter/material.dart';
import 'package:tiki_style/tiki_style.dart';

class ContainerHomeViewCard extends StatelessWidget {
  const ContainerHomeViewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: SizeProvider.instance.height(215),
      child: FittedBox(
        fit: BoxFit.cover,
        child: ImgProvider.walletCard,
      )
    );
  }
}

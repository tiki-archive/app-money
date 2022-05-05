import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'service.dart';
import 'ui/container.dart';

class ContainerPresenter {
  final ContainerService service;

  ContainerPresenter(this.service);

  ChangeNotifierProvider<ContainerService> home({bool example = false}) {
    return ChangeNotifierProvider.value(
        value: service, child: ContainerHomeLayout(example: example));
  }
}

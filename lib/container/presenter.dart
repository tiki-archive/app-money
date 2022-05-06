import 'package:provider/provider.dart';
import 'service.dart';
import 'ui/layout.dart';

class ContainerPresenter {
  final ContainerService service;

  ContainerPresenter(this.service);

  ChangeNotifierProvider<ContainerService> home({bool example = false}) {
    return ChangeNotifierProvider.value(
        value: service, child: MoneyContainerUiLayout(example: example));
  }
}

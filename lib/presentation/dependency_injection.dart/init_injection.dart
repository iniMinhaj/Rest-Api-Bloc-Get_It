import 'package:consume_api/data/remote_service.dart';
import 'package:get_it/get_it.dart';

class DependencyInjection {
  static void setupLocator() {
    GetIt.I.registerSingleton<RemoteService>(RemoteService());
  }
}

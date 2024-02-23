import 'package:auto_injector/auto_injector.dart';
import 'package:flutter_school/export.dart';
import 'package:flutter_school/src/features/marca/controllers/marca_list_controller.dart';
import 'package:flutter_school/src/features/marca/repositories/marca_repository.dart';
import 'package:flutter_school/src/features/patrimonio/controllers/patrimonio_list_controller.dart';
import 'package:flutter_school/src/features/patrimonio/repositories/patrimonio_repository.dart';
import 'package:flutter_school/src/shared/api_client/api_client.dart';
import 'package:flutter_school/src/shared/api_client/debug_api_client.dart';
import 'package:flutter_school/src/util/navigator/app_nav.dart';
import 'package:flutter_school/src/util/navigator/navigation_service.dart';

final AutoInjector injector = AutoInjector();

Future injectorInit() async {
  injector.add(MarcaListController.new);
  injector.add(PatrimonioController.new);
  injector.addSingleton<AppNav>(NavigationService.new);
  injector.add(PatrimonioListController.new);
  injector.addSingleton<ApiClient>(DebugApiClient.new);
  injector.addSingleton(PatrimonioRepository.new);
  injector.addSingleton(MarcaRepository.new);
  injector.commit();
}

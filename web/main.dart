import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';
import 'package:client/app_component.template.dart' as ng;
import 'package:client/src/context/user_context.dart';
import 'package:client/src/guards/auth_guard.dart';

import 'main.template.dart' as self;

@GenerateInjector([
  ClassProvider(UserContext),
  ClassProvider(AppRouterHook),
  ExistingProvider(RouterHook, AppRouterHook),
  routerProviders,
])

final InjectorFactory appInjector = self.appInjector$Injector;

void main() {
  runApp(ng.AppComponentNgFactory, createInjector: appInjector);
}

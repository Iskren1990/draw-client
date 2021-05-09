import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../context/user_context.dart';
import '../routes.dart';

class AppRouterHook extends RouterHook {
  final UserContext userContext;
  final Injector _injector;
  Router _router;

  AppRouterHook(this.userContext, this._injector);

  Router get router => _router ??= _injector.provideType(Router);

  @override
  Future<bool> canActivate(
    Object componentInstance,
    RouterState oldState,
    RouterState newState,
  ) async {
    final isLogged = userContext.isLogged();
    final config = newState.routePath.additionalData;

    if (config is Routes) {
      if (config.redirectIfNotLoggedIn && !isLogged) {
        // redirect to login if not logged
        // ignore: unawaited_futures
        router.navigateByUrl('/login', replace: true);
        return false;
      }

      if (config.redirectIfLoggedIn && isLogged) {
        // ignore: unawaited_futures
        router.navigateByUrl('/', replace: true);
        return false;
      }
    }

    return true;
  }
}

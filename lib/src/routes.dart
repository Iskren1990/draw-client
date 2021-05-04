import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'user/login_component/login_component.template.dart' as login_template;
import 'user/register_component/register_component.template.dart' as register_template;
import 'draw/user_draws_component/user_draws_component.template.dart' as user_draws_template;


export 'route_paths.dart';

class Routes {
  static final login = RouteDefinition(
    routePath: RoutePaths.login,
    component: login_template.LoginComponentNgFactory,
  );
  static final register = RouteDefinition(
    routePath: RoutePaths.register,
    component: register_template.RegisterComponentNgFactory,
  );
  static final userDrows = RouteDefinition(
    routePath: RoutePaths.userDraws,
    component: user_draws_template.UserDrawsComponentNgFactory,
  );
   static final all = <RouteDefinition>[
    login,
    register,
    userDrows,
  ];
}

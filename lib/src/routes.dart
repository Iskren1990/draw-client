import 'package:angular_router/angular_router.dart';

import 'route_paths.dart';
import 'user/login_component/login_component.template.dart' as login_template;
import 'user/register_component/register_component.template.dart' as register_template;
import 'draw/user_draws_component/user_draws_component.template.dart' as user_draws_template;
import 'draw/create_draw_component/create_draw_component.template.dart' as create_draw_template;
import 'draw/draw_component/draw_component.template.dart' as draw_component_template;


export 'route_paths.dart';

class Routes {

   bool redirectIfNotLoggedIn = false;
   bool redirectIfLoggedIn = false;

  Routes.conf({
    this.redirectIfNotLoggedIn,
    this.redirectIfLoggedIn
  });

  static final login = RouteDefinition(
    routePath: RoutePaths.login,
    component: login_template.LoginComponentNgFactory,
    additionalData: Routes.conf(redirectIfNotLoggedIn: false, redirectIfLoggedIn: true),
  );

  static final register = RouteDefinition(
    routePath: RoutePaths.register,
    component: register_template.RegisterComponentNgFactory,
    additionalData: Routes.conf(redirectIfNotLoggedIn: false, redirectIfLoggedIn: true),
  );

  static final createDraw = RouteDefinition(
    routePath: RoutePaths.createDraw,
    component: create_draw_template.CreateDrawComponentNgFactory,
    additionalData: Routes.conf(redirectIfNotLoggedIn: true, redirectIfLoggedIn: false),
  );

  static  final userDrows = RouteDefinition(
    routePath: RoutePaths.userDraws,
    component: user_draws_template.UserDrawsComponentNgFactory,
    additionalData: Routes.conf(redirectIfNotLoggedIn: true, redirectIfLoggedIn: false),
  );

    static  final viewDraw = RouteDefinition(
    routePath: RoutePaths.viewDraw,
    component: draw_component_template.DrawComponentNgFactory,
    additionalData: Routes.conf(redirectIfNotLoggedIn: true, redirectIfLoggedIn: false),
  );

    static final all = <RouteDefinition>[
    login,
    register,
    userDrows,
    createDraw,
    viewDraw,
  ];
}
 
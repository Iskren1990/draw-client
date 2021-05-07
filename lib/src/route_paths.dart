import 'package:angular_router/angular_router.dart';

const idParam = 'id';

class RoutePaths {
  static final login = RoutePath(path: '/login');
  static final register = RoutePath(path: '/register');
  static final userDraws = RoutePath(path: '/');
  static final createDraw = RoutePath(path: '/create');
  static final viewDraw = RoutePath(path: '/view/:$idParam');
}

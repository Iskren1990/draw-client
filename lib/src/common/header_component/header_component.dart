import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../../services/user_service.dart';
import '../../context/user_context.dart';

@Component(
  selector: 'header-template',
  templateUrl: 'header_template.html',
  styles: ['.active-route {transition: background-color .3s}'],
  directives: [routerDirectives, coreDirectives],
  providers: [ClassProvider(UserService)],
)
class HeaderComponent implements OnInit, OnDestroy {
  StreamSubscription<String> userStateSubscription;

  UserService userService;
  bool isLogged;
  String username;
  final Router _router;

  HeaderComponent(this._router, this.userService);

  @override
  void ngOnInit() {
    userStateSubscription = userService.userUpdated.listen((e) => userLocalStateSet());
  }

  @override
  void ngOnDestroy() {
    userStateSubscription.cancel();
  }

  void logoutFn() {
    userService.getLogout();
    _router.navigate('/login');
  }

  void userLocalStateSet() {
    username = UserContext().username ?? 'Guest';
    isLogged = username == 'Guest' ? false : true;
  }
}

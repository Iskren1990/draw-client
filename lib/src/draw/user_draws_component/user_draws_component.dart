import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'package:client/src/routes.dart';
import 'package:client/src/services/draw_service.dart';
import '../../context/user_context.dart';
import '../draw_card_component/draw_card_component.dart';

@Component(
  selector: 'user-draws-component',
  templateUrl: 'user_draws_component.html',
  directives: [coreDirectives, DrawCardComponent],
  providers: [ClassProvider(DrawService)],
)

class UserDrawsComponent implements OnInit {

  final Router _router;
  final DrawService drawService;
  var draws;

  UserDrawsComponent(this._router, this.drawService);

  @override
  void ngOnInit() async {
    var username = UserContext().username;
    if (username == null) {
      await _router.navigate(RoutePaths.login.toUrl());
      return;
    }

    draws = await drawService.getUserDrows();
  }
}

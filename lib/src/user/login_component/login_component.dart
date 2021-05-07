import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import '../../services/user_service.dart';
import '../../models/user_model.dart';
import '../../common/common_auth_inputs/common_auth_inputs_component.dart';

@Component(
    selector: 'login-component',
    templateUrl: 'login_component.html',
    styleUrls: ['login_component.css'],
    directives: [coreDirectives, formDirectives, CommonAuthInputsComponent],
    providers: [ClassProvider(UserService)],
    )
    
class LoginComponent implements OnInit {
  final UserService userService;
  UserModel user;
  
  LoginComponent(this.userService);
  @override
  void ngOnInit() {
    user = UserModel();
  }

  void login(NgForm loginForm) {
    userService.postLogin(user);
  }
}

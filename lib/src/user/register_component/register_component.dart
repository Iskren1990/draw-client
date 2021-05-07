import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import '../../services/user_service.dart';
import '../../common/common_auth_inputs/common_auth_inputs_component.dart';
import '../../models/user_model.dart';

@Component(
  selector: 'register-component',
  templateUrl: 'register_component.html',
  styleUrls: ['register_component.css'],
  directives: [coreDirectives, formDirectives, CommonAuthInputsComponent],
  providers: [ClassProvider(UserService)],
)
class RegisterComponent implements OnInit {
  UserModel user;
  final UserService userService;

  RegisterComponent(this.userService);
  @override
  void ngOnInit() {
    user = UserModel();
  }

  void register(NgForm registerForm) {
    userService.postRegister(user);
  }
}

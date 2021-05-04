import 'package:angular/angular.dart';
import 'dart:html';

import 'package:angular_forms/angular_forms.dart';
import '../../common/common_auth_inputs/common_auth_inputs_component.dart';
import '../../models/user_model.dart';

@Component(
  selector: 'login-component',
  templateUrl: 'login_component.html',
  styleUrls: ['login_component.css'],
  directives: [
    coreDirectives,
    formDirectives,
    CommonAuthInputsComponent
  ]
)
class LoginComponent implements OnInit{

  UserModel user;

  @override
  void ngOnInit() {
    user = UserModel();
  }

  void login(NgForm loginForm) { 
    window.console.log(user);
    // server request through user service
  }
}

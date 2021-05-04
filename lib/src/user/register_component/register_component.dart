import 'package:angular/angular.dart';
import 'dart:html';

import 'package:angular_forms/angular_forms.dart';
import '../../common/common_auth_inputs/common_auth_inputs_component.dart';
import '../../models/user_model.dart';

@Component(
    selector: 'register-component',
    templateUrl: 'register_component.html',
    styleUrls: ['register_component.css'],
    directives: [
      coreDirectives, 
      formDirectives,
      CommonAuthInputsComponent
      ]
    )

class RegisterComponent implements OnInit {
  UserModel user;
  @override
  void ngOnInit() {
    user = UserModel();
  } 

    void register(NgForm registerForm) {
    window.console.log(registerForm);
    // server request through user service
  }
} 

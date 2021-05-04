import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
    selector: 'common-auth-inputs-component',
    templateUrl: 'common_auth_inputs_component.html',
    styleUrls: ['common_auth_inputs_component.css'],
    directives: [coreDirectives, formDirectives])

class CommonAuthInputsComponent {
  @Output()
  NgControlName username;
  @Output()
  NgControlName  password;
  @Input()
  dynamic user;
}

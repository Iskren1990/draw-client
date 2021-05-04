import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'header-template',
  templateUrl: 'header_template.html',
  directives: [
    routerDirectives,
  ]
)
class HeaderComponent implements OnInit  {
  var user = 'Guest';

  @override
  void ngOnInit() {
    user = 'Administrator';
  }
}


import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/routes.dart';

import 'src/common/header_component/header_component.dart';
import 'src/common/footer_component/footer_component.dart';

@Component(
    selector: 'my-app',
    styleUrls: ['app_component.css'],
    templateUrl: 'app_component.html',
    directives: [
      routerDirectives,
      HeaderComponent,
      FooterComponent,
      NgIf,
    ],
    exports: [RoutePaths, Routes, routerDirectives]
    )

class AppComponent {}

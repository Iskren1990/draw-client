import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../../models/draw_model.dart';

@Component(
  selector: 'draw-card-component',
  templateUrl: 'draw_card_component.html',
  directives: [routerDirectives]
)
class DrawCardComponent implements OnInit{
  @Input()
  DrawModel draw;

  @ViewChild('img')
  ImageElement img;
  @override
  void ngOnInit() {
    img.srcset = draw.drawUrl;
  }
}

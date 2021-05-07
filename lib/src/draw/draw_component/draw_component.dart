import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import '../../models/draw_model.dart';

import '../../services/draw_service.dart';

import '../../common/btn/btn_component.dart';

@Component(
  selector: 'draw-component',
  templateUrl: 'draw_component.html',
  styleUrls: ['draw_component.css'],
  directives: [coreDirectives, BtnComponent],
  providers: [ClassProvider(DrawService)],
)
class DrawComponent implements OnActivate {
  String delete = 'Delete Draw';
  DrawModel draw;
  String id;
  final DrawService drawService;

  @ViewChild('canvasEl')
  CanvasElement canvas;
  @ViewChild('title')
  HtmlElement title;

  DrawComponent(this.drawService);

  @override
  void onActivate(_, RouterState current) async {
    id = current.parameters['id'];

    if (id != null) {
      await drawService.getChosenDraw(id)
      .then((draw) {
        var ctx = canvas.context2D;
        ctx.drawImage(draw.fakeCanvas(draw.draw), 0, 0);
        title.innerText = draw.title;
      });
    }
  }

  void onDelete() {
      drawService.deleteChosenDraw(id);
  }
}

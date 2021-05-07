import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';

import '../../models/draw_model.dart';
import '../../models/canvas_model.dart';

import '../../services/draw_service.dart';

import '../../common/btn/btn_component.dart';

@Component(
  selector: 'create-draw-component',
  templateUrl: 'create_draw_component.html',
  styleUrls: ['create_draw_component.css'],
  directives: [coreDirectives, formDirectives, BtnComponent],
  providers: [ClassProvider(DrawService)],
)
class CreateDrawComponent extends OnInit {
  String save = 'Save Poligon';
  bool isDrawable;
  CanvasModel ctx;
  DrawModel draw;
  final DrawService drawService;

  CreateDrawComponent(this.drawService);
  
  @ViewChild('canvasEl')
  CanvasElement canvas;
  int offsetLeft;
  int offsetTop;

  @override
  void ngOnInit() {
    isDrawable = true;
    ctx = CanvasModel(canvas);
    draw = DrawModel();
  }

  void newLine(event) {
    if (isDrawable) ctx.drawLine(event);
  }

  void onSave(click) {
    isDrawable = false;
    draw.draw = ctx.saveCanvas();
    drawService.postSaveDrow(draw);
  }
}

import 'dart:convert';
import 'dart:html';

class DrawModel {
  String _id;
  String ownerId;
  String title;
  List<dynamic> draw;
  String drawUrl;

  DrawModel();

  Map<String, dynamic> drowToJson(ownerId) {
    return {
      'ownerId': ownerId,
      'title': title,
      'draw': json.encode(draw),
    };
  }

  DrawModel.drawFromJson(Map data) {
    _id = data['_id'];
    ownerId = data['ownerId'];
    title = data['title'];
    draw = data['draw'];
    drawUrl = fakeCanvas(data['draw']).toDataUrl();
  }

  CanvasElement fakeCanvas(List<dynamic> drawCoordinates) {
    final canvas = CanvasElement(width: 500, height: 500);
    final CanvasRenderingContext2D ctx = canvas.getContext('2d');
    ctx.lineWidth = 2;
    ctx.lineCap = 'round';
    ctx.beginPath();
    drawCoordinates.forEach((coord) {
      ctx.lineTo(coord['x'], coord['y']);
      ctx.stroke();
    });
    ctx.closePath();
    ctx.stroke();

    return canvas;
  }

  String get id {
    return _id;
  }
}

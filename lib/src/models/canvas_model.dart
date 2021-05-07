import 'dart:html';

class CanvasModel {
  int offsetLeft;
  int offsetTop;
  CanvasElement canvas;
  CanvasRenderingContext2D ctx;
  List<Map<String, int>> draw = [];

  CanvasModel(this.canvas) {
    ctx = generate();
  }

  CanvasRenderingContext2D generate() {
    offsetLeft = canvas.offsetLeft;
    offsetTop = canvas.offsetTop;
    CanvasRenderingContext2D ctx = canvas.getContext('2d');
    ctx.lineWidth = 2;
    ctx.lineCap = 'round';
    ctx.beginPath();

    return ctx;
  }

  void drawLine(event) {
    offsetLeft = canvas.offsetLeft;
    offsetTop = canvas.offsetTop;
    draw.add({
      'x': event.client.x - offsetLeft - 1,
      'y': event.client.y - offsetTop - 1
    });
    ctx.lineTo(event.client.x - offsetLeft - 1, event.client.y - offsetTop - 1);
    ctx.stroke();
  }

  List<dynamic>  saveCanvas() {
    ctx.closePath();
    ctx.stroke();
    return draw;
  }
}

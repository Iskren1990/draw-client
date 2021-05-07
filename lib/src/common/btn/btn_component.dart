import 'package:angular/angular.dart';

@Component(
  selector: 'btn-component',
  template: '''
   <button class="btn waves-effect waves-light">{{value}}</button>
  ''',
   styles: ['.btn: { margin: 10px} '],
)
class BtnComponent {
  @Input()
  String value;
}

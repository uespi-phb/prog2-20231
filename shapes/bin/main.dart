import 'package:shapes/circle.dart';

void main() {
  var c1 = Circle(10);

  print('c1=$c1 --> radius=${c1.getRadius()}');
  c1.setRadius(30);
  print('c1=$c1 --> radius=${c1.getRadius()}');

  c1.radius = 10;
  print('c1=$c1 --> radius=${c1.radius}');
  c1.radius = -30;
  print('c1=$c1 --> radius=${c1.getRadius()}');
}

import 'dart:math';

class Point {
  final double _x;
  final double _y;
  
  const Point(this._x, this._y);
  
  const Point.origin() : _x = 0, _y = 0;
  
  double getX() => _x;
  double getY() => _y;
  
  double get x { 
    return _x; 
  }
  double get y { 
    return _y; 
  }
  
  double get xy => x + y;
  
  
  void show() {
    print('Point($_x,$_y) : $hashCode');    
  }
  
  double distanceTo(Point p) {
    var dx = (_x - p._x)*(_x - p._x);
    var dy = (_y - p._y)*(_y - p._y);
    return sqrt(dx + dy);
  }
}

void main() {
  var p1 = const Point(5,3);
  var p2 = const Point(15,-3);
 // var z1 = Point.origin();
 
  p1.show();
  p2.show();
  
  var d = p1.distanceTo(p2);
  print('d = $d');
  
  print('x=${p1.getX()}, y=${p1.getY()}');
  print('x=${p1.x}, y=${p1.y}');
  print('xy=${p1.xy}');
}

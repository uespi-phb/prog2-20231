class Circle {
  double _radius;

  Circle(this._radius);

  @override
  String toString() => 'Circle($_radius)';

  double getRadius() => _radius;

  void setRadius(double radius) {
    if (radius < 0.0) {
      throw Exception('Invalid radius value: $radius');
    }
    _radius = radius;
  }

  double get radius => _radius;

  set radius(double r) {
    if (r < 0.0) {
      throw Exception('Invalid radius value: $r');
    }
    _radius = r;
  }
}

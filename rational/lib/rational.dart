class Rational {
  final int _num;
  final int _den;

  Rational(
    this._num, [
    this._den = 1,
  ]) {
    _validate();
  }

  Rational.from(Rational r)
      : _num = r._num,
        _den = r._den {
    _validate();
  }

  Rational.fromString(String r)
      : _num = int.parse(r.split('/')[0]),
        _den = int.parse(r.split('/')[1]) {
    _validate();
  }

  @override
  String toString() {
    String num = (_den < 0) ? '${-_num}' : '$_num';
    String den = '${_den.abs()}';
    return (_den != 1) ? '$num/$den' : num;
  }

  void _validate() {
    if (_den == 0) {
      throw Exception('Rational denominator cannot be zero');
    }
  }

  int _signal(int n) => (n > 0)
      ? 1
      : (n < 0)
          ? -1
          : 0;

  Rational simplify() {
    int num = _num.abs();
    int den = _den.abs();
    int max = (num < den) ? num : den;
    int div = 2;

    while (div <= max) {
      if ((num % div == 0) && (den % div == 0)) {
        num ~/= div; // num = num ~/ div
        den ~/= div; // den = den ~/ div
        max = (num < den) ? num : den;
      } else {
        div++;
      }
    }
    num = _signal(_num) * num;
    den = _signal(_den) * den;

    return Rational(num, den);
  }
}

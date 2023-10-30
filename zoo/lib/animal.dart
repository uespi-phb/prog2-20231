enum AnimalType {
  mammal,
  bird,
  reptile,
}

abstract class Animal {
  final AnimalType type;
  final String name;
  final DateTime brithDate;
  final String sound;
  final bool canFly;
  final bool canSwim;
  final bool canWalk;

  Animal({
    required this.type,
    required this.name,
    required this.brithDate,
    required this.sound,
    required this.canFly,
    required this.canSwim,
    required this.canWalk,
  });

  @override
  String toString() => '$name($sound)';

  int get age {
    var now = DateTime.now();
    return now.difference(brithDate).inDays ~/ 30;
  }
}

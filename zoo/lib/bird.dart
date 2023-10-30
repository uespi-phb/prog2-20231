import './animal.dart';

class Bird extends Animal {
  Bird({
    required super.name,
    required super.brithDate,
    required super.sound,
    required super.canFly,
    required super.canSwim,
    required super.canWalk,
  }) : super(type: AnimalType.bird);
}

import './animal.dart';

class Reptile extends Animal {
  Reptile({
    required super.name,
    required super.brithDate,
    required super.sound,
    required super.canFly,
    required super.canSwim,
    required super.canWalk,
  }) : super(type: AnimalType.reptile);
}

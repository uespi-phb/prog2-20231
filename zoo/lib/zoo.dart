import 'dart:io';
import 'dart:math';

import './animal.dart';
import './mammal.dart';
import './bird.dart';
import './reptile.dart';

class Zoo {
  List<Animal> animals = [];

  void addAnimal(Animal animal) => animals.add(animal);

  void load(String fileName) {
    var rnd = Random();
    var data = File(fileName).readAsLinesSync();

    animals.clear();

    for (var i = 1; i < data.length; i++) {
      Animal animal;
      // "Cachorro,mamal,Late,0,1,1" --> ['Cachorro','mammal','Late','0','1','1']
      var animalData = data[i].split(',');
      var birth = DateTime.now();

      birth = birth.subtract(
        Duration(days: 30 + rnd.nextInt(650)),
      );

      switch (animalData[1]) {
        case 'mammal':
          animal = Mammal(
            name: animalData[0],
            brithDate: birth,
            sound: animalData[2],
            canFly: animalData[3] == '1',
            canSwim: animalData[4] == '1',
            canWalk: animalData[5] == '1',
          );
          break;
        case 'bird':
          animal = Bird(
            name: animalData[0],
            brithDate: birth,
            sound: animalData[2],
            canFly: animalData[3] == '1',
            canSwim: animalData[4] == '1',
            canWalk: animalData[5] == '1',
          );
          break;
        case 'reptile':
          animal = Reptile(
            name: animalData[0],
            brithDate: birth,
            sound: animalData[2],
            canFly: animalData[3] == '1',
            canSwim: animalData[4] == '1',
            canWalk: animalData[5] == '1',
          );
          break;
        default:
          throw Exception('Invalid animal type: ${animalData[1]}');
      }
      animals.add(animal);
    }
  }

  void listAnimal() {
    for (var animal in animals) {
      print('$animal\t${animal.age}');
    }
  }
}

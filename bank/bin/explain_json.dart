import 'dart:convert';

class Sample {
  final int id;
  final String name;
  final double height;

  Sample({
    required this.id,
    required this.name,
    required this.height,
  });

  factory Sample.fromMap(Map<String, dynamic> map) => Sample(
        id: map['id'],
        name: map['name'],
        height: map['height'],
      );

  factory Sample.fromJson(String json) => Sample.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'height': height,
      };
}

void main() {
  var s = Sample(id: 110, name: 'Bob Jones', height: 1.85);
  const json = '{"id":100,"name":"Mary Jane","height":1.65}';

  print(s.toMap());
  print(jsonEncode(s.toMap()));
  print('------------');
  print(Sample.fromJson(json).toMap());
}

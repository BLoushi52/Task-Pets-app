import 'dart:convert';

class Pet {
  int id;
  String name;
  String image;
  int age;
  bool adopted;
  String gender;
  Pet({
    required this.id,
    required this.name,
    required this.image,
    required this.age,
    required this.adopted,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'age': age,
      'adopted': adopted,
      'gender': gender,
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      age: map['age']?.toInt() ?? 0,
      adopted: map['adopted'] ?? false,
      gender: map['gender'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Pet.fromJson(String source) => Pet.fromMap(json.decode(source));
}

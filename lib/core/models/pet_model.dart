class Pet {
  final String id;
  final String name;
  final String breed;
  final String gender;
  final String age;
  final String height;
  final String weight;

  Pet({
    required this.id,
    required this.name,
    required this.breed,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
  });

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      breed: map['breed'] ?? '',
      gender: map['gender'] ?? '',
      age: map['age']?.toString() ?? '',
      height: map['height']?.toString() ?? '',
      weight: map['weight']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'breed': breed,
      'gender': gender,
      'age': age,
      'height': height,
      'weight': weight,
    };
  }
}

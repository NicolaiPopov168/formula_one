class Driver {
  final String firstName;
  final String lastName;
  final String nationality;
  final String dateOfBirth;
  final String? photoUrl; // Новое поле для хранения пути к фотографии гонщика

  Driver({
    required this.firstName,
    required this.lastName,
    required this.nationality,
    required this.dateOfBirth,
    this.photoUrl, // Обновленный конструктор
  });
}

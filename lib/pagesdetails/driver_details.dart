import 'package:flutter/material.dart';
import 'package:formula_one/pagesmodel/driver_model.dart';

class DriverDetailsPage extends StatelessWidget {
  final Driver driver;

  DriverDetailsPage({required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о чемпионе мира'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Здесь можно добавить другие поля с информацией о чемпионе в зависимости от модели Driver
            Text(
              'Имя: ${driver.firstName} ${driver.lastName}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Национальность: ${driver.nationality}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Дата рождения: ${driver.dateOfBirth}',
              style: TextStyle(fontSize: 18),
            ),
            // Добавьте другие поля с информацией о чемпионе в зависимости от того, что есть в модели Driver
          ],
        ),
      ),
    );
  }
}

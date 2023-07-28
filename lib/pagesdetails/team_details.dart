import 'package:flutter/material.dart';
import 'package:formula_one/pagesmodel/team_model.dart';

class TeamDetailsPage extends StatelessWidget {
  final Team team;

  TeamDetailsPage({required this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Информация о команде'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Название: ${team.name}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              'Национальность: ${team.nationality}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'ID: ${team.constructorId}',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Ссылка: ${team.url}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

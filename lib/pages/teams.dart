import 'package:flutter/material.dart';
import 'package:formula_one/pagesdetails/team_details.dart';
import 'package:formula_one/pagesmodel/team_model.dart';
import '../api/team_api_provider.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  _TeamsPageState createState() => _TeamsPageState();
}

class _TeamsPageState extends State<TeamsPage> {
  List<Team> teamsList = [];

  @override
  void initState() {
    super.initState();
    _fetchChampionTeams();
  }

  void _fetchChampionTeams() async {
    try {
      final teams = await FormulaOneTeamApi().fetchChampionTeamsFromApi();
      setState(() {
        teamsList = teams;
      });
      //print('Teams List: $teamsList'); // Добавляем отладочную информацию
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: teamsList.length,
      itemBuilder: (context, index) {
        final team = teamsList[index];
        return ListTile(
          title: Text('${team.name}'),
          subtitle: Text('Nationality: ${team.nationality}'),
          onTap: () {
            // При тапе на элемент списка можно перейти на страницу с дополнительной информацией о команде
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TeamDetailsPage(team: team),
              ),
            );
          },
        );
      },
    );
  }
}

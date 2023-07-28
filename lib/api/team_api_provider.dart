import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:formula_one/pagesmodel/team_model.dart';

class FormulaOneTeamApi {
  Future<List<Team>> fetchChampionTeamsFromApi() async {
    final response = await http.get(Uri.parse('http://ergast.com/api/f1/current/constructorStandings.json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> teamsData = data['MRData']['StandingsTable']['StandingsLists'][0]['ConstructorStandings'];
      return teamsData.map((json) => Team(
        constructorId: json['Constructor']['constructorId'],
        name: json['Constructor']['name'],
        nationality: json['Constructor']['nationality'],
        url: json['Constructor']['url'],
      )).toList();
    } else {
      throw Exception('Failed to load champion teams');
    }
  }
}

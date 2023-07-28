import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:formula_one/pagesmodel/driver_model.dart';

class FormulaOneApi {
  Future<List<Driver>> fetchWorldChampionsFromApi() async {
    final response = await http.get(Uri.parse('http://ergast.com/api/f1/driverStandings/1/drivers.json'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> driversData = data['MRData']['DriverTable']['Drivers'];
      return driversData.map((json) => Driver(
        firstName: json['givenName'],
        lastName: json['familyName'],
        nationality: json['nationality'],
        dateOfBirth: json['dateOfBirth'],
      )).toList();
    } else {
      throw Exception('Failed to load world champions');
    }
  }
}


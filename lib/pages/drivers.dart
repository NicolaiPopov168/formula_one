import 'package:flutter/material.dart';
import 'package:formula_one/api/driver_api_provider.dart';
import 'package:formula_one/pagesmodel/driver_model.dart';
import 'package:formula_one/pagesdetails/driver_details.dart';

class DriversPage extends StatefulWidget {
  const DriversPage({Key? key}) : super(key: key);

  @override
  _DriversPageState createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  List<Driver> worldChampionsList = [];

  @override
  void initState() {
    super.initState();
    _fetchWorldChampions();
  }

  void _fetchWorldChampions() async {
    try {
      final champions = await FormulaOneApi().fetchWorldChampionsFromApi();
      setState(() {
        worldChampionsList = champions;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: worldChampionsList.length,
      itemBuilder: (context, index) {
        final champion = worldChampionsList[index];
        return ListTile(
          leading: CircleAvatar(
            // Используем фото гонщика из assets, если есть, иначе иконку шлема
            backgroundImage: champion.photoUrl != null
                ? AssetImage(champion.photoUrl!) // Используем AssetImage для загрузки фото из assets
                : AssetImage('assets/helmet_icon.png'), // Иконка шлема из assets
            backgroundColor: Colors.blue,
          ),
          title: Text('${champion.firstName} ${champion.lastName}'),
          subtitle: Text('Nationality: ${champion.nationality}, DOB: ${champion.dateOfBirth}'),
          onTap: () {
            // При тапе на элемент списка можно перейти на страницу с дополнительной информацией о чемпионе
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DriverDetailsPage(driver: champion),
              ),
            );
          },
        );
      },
    );
  }
}

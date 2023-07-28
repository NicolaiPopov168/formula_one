import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:formula_one/main.dart';
import 'package:formula_one/pages/drivers.dart';
import 'package:formula_one/pages/teams.dart';
import 'package:formula_one/pages/tracks.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  // Определение виджетов для вкладок
  static List<Widget> _widgetOptions = <Widget>[
    Text(
      'Главная',
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    const DriversPage(), // Ваш виджет для вкладки Drivers
    const TeamsPage(), // Ваш виджет для вкладки Teams
    TracksPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Возвращаем true, чтобы разрешить выход из приложения
        return true;
      },
      child: Scaffold(
        appBar: null,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home', // Установите пустую строку для подписи
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_motorsports),
              label: 'Drivers',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car),
              label: 'Teams',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Tracks',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          iconSize: 30, // Установите желаемый размер иконок
        ),
      ),
    );
  }
}

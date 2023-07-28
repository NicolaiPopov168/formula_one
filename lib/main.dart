import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'splash/splash.dart';
import 'pages/drivers.dart'; // Импортируем файл drivers.dart
import 'pagesdetails/driver_details.dart'; // Импортируем файл driver_details.dart
import 'api/driver_api_provider.dart'; // Импортируем файл driver_api_provider.dart

void main() {
  /*SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.black, // Устанавливаем темный цвет для нижней системной панели
    ),
  );*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider( // Используем MultiProvider для добавления провайдера FormulaOneApi
      providers: [
        Provider<FormulaOneApi>(
          create: (_) => FormulaOneApi(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Splash(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

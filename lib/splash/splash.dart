//import 'dart:js_util';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:formula_one/main.dart';

import '../home.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(const Duration(milliseconds: 5000), (){});
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/f1splash.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
import 'package:band_name/src/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainStartup());

class MainStartup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      //home: HomePage();
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
      },
    );
  }
}

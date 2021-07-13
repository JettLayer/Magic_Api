import 'package:flutter/material.dart';
import 'package:magic_api/src/model/magic_model.dart';
import 'package:magic_api/src/pages/detalles_cartas.dart';
import 'package:magic_api/src/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Magic',
      initialRoute: '/main',
      routes: {
        '/main': (_) => MainPage(),
        '/detalles_cartas': (_) => DetallesCards()
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:life_point/screens/ui.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        '/': (BuildContext context) => SplashUI(),
        'login': (BuildContext context) => LoginUI(),
        'register': (BuildContext context) => RegisterUI(),
        'home': (BuildContext context) => HomeUI(),
        'solicitar-servicio': (BuildContext context) => SolicitarServicioUI()
      },
    );
  }
}

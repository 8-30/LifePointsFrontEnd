import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:life_point/screens/ui.dart';
import 'controllers/controllers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  Get.put<AuthController>(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: FirebaseAnalytics()),
      ],
      title: 'Life Points',
      initialRoute: 'login',
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

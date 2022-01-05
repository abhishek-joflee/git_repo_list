import 'package:flutter/material.dart';

import 'controller/auth_controller.dart';
import 'ui/home/home_page.dart';
import 'ui/splash/biometric_login_page.dart';
import 'utils/my_flutter_init.dart';

void main() async {
  await myFlutterInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
        future: AuthController.authMe(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const BioMetricLoginPage();
            case ConnectionState.done:
              return const MyHomePage();
          }
        },
      ),
    );
  }
}

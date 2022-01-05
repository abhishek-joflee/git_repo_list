import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/models/repo.dart';
import 'ui/home/home_page.dart';
import 'utils/my_hive_constants.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Repo>(RepoAdapter());
  await Hive.openBox<Repo>(repoBoxName);
  await Hive.openBox(utilsBoxName);
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
      home: const MyHomePage(),
    );
  }
}

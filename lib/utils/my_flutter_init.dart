import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:local_auth/local_auth.dart';

import '../data/models/repo.dart';
import 'my_hive_constants.dart';

/// initial thing to do before app starts
/// returns the bool indicating if the Device Support BioAuth
Future<bool> myFlutterInit() async {
  // init hive
  await Hive.initFlutter();
  Hive.registerAdapter<Repo>(RepoAdapter());
  await Hive.openBox<Repo>(repoBoxName);
  await Hive.openBox(utilsBoxName);

  // local auth
  return await LocalAuthentication().isDeviceSupported();
}

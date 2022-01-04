import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/models/repo.dart';
import 'logic/repo_controller.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Repo>(RepoAdapter());
  await Hive.openBox<Repo>('repo');
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final RepoController repoController = RepoController();
  final Box<Repo> repoBox = Hive.box('repo');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jake's Git"),
      ),
      body: ValueListenableBuilder(
        valueListenable: repoBox.listenable(),
        builder: (ctx, box, _) {
          return ListView.builder(
            itemCount: repoBox.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  repoBox.getAt(index)!.name,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: repoController.fetchRepos,
        tooltip: 'Add Repo',
        child: const Icon(Icons.add),
      ),
    );
  }
}

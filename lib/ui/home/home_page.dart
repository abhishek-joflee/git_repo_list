import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/repo.dart';
import '../../utils/my_hive_constants.dart';
import 'repo_list_view.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(96, 125, 139, 1),
        title: const Text(
          "Jake's Git",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Box<Repo> repoBox = Hive.box<Repo>(repoBoxName);
              repoBox.deleteAll(repoBox.keys);

              Box utilsBox = Hive.box(utilsBoxName);
              utilsBox.deleteAll(utilsBox.keys);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),

      // body
      body: RepoListView(),
    );
  }
}

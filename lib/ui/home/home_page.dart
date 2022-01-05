import 'package:flutter/material.dart';

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
      ),

      // body
      body: const RepoListView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/models/repo.dart';
import 'logic/repo_controller.dart';
import 'ui/list_tile_subtitle_icon_and_text.dart';
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final RepoController repoController = RepoController();
  final Box<Repo> repoBox = Hive.box(repoBoxName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(96, 125, 139, 1),
        title: const Text(
          "Jake's Git",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: ValueListenableBuilder(
        valueListenable: repoBox.listenable(),
        builder: (ctx, box, _) {
          return ListView.separated(
            itemCount: repoBox.length,
            itemBuilder: (context, index) {
              // REPO OBJECT
              Repo? repo = repoBox.getAt(index);

              // RETURN UI
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      // REPO ICON
                      const Icon(Icons.book, size: 42),
                      const SizedBox(width: 6),

                      // MAIN COLUMN
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // REPO NAME
                            Text(
                              repo?.name ?? '',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w600),
                            ),

                            // REPO DESCRIPTION
                            Text(
                              repo?.description ?? '',
                              maxLines: 2,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black.withOpacity(.5),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),

                            // BOTTOM ICONS ROW
                            Row(
                              children: [
                                // LANGUAGE
                                ListTileSubtitleIconAndText(
                                  iconData: Icons.code,
                                  text: repo?.language ?? '',
                                ),

                                // ISSUE COUNT
                                ListTileSubtitleIconAndText(
                                  iconData: Icons.bug_report,
                                  text: repo?.openIssuesCount.toString() ?? '',
                                ),

                                // START COUNT
                                ListTileSubtitleIconAndText(
                                  iconData: Icons.face,
                                  text: repo?.starCount.toString() ?? '',
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 0,
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

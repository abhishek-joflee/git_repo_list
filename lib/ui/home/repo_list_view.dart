import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/models/repo.dart';
import '../../logic/repo_controller.dart';
import '../../utils/my_hive_constants.dart';
import '../widgets/icon_text_chip.dart';

class RepoListView extends StatelessWidget {
  RepoListView({Key? key}) : super(key: key);

  final RepoController repoController = RepoController();
  final Box<Repo> repoBox = Hive.box(repoBoxName);
  bool isFetching = false;

  Future<void> _fetchRepos() async {
    // return if already fetching
    if (isFetching) return;

    isFetching = true;
    await repoController.fetchRepos();
    isFetching = false;
  }

  @override
  Widget build(BuildContext context) {
    // CALLING FETCH REPOS ON FIRST APP LAUNCH
    if (repoBox.length == 0) {
      Future.delayed(Duration.zero, _fetchRepos);
    }

    // HIVE WILL REBUILD THIS, IF DATA ADDED
    return ValueListenableBuilder(
      valueListenable: repoBox.listenable(),
      builder: (ctx, box, _) {
        // NOTIFICATION LISTENER (for pagination)
        return ListView.separated(
          itemCount: repoBox.length + 1,
          itemBuilder: (context, index) {
            if (index != repoBox.length) {
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

                            // BOTTOM ICONS-TEXT ROW
                            Row(
                              children: [
                                // LANGUAGE
                                IconTextChip(
                                  iconData: Icons.code,
                                  text: repo?.language ?? '',
                                ),

                                // ISSUE COUNT
                                IconTextChip(
                                  iconData: Icons.bug_report,
                                  text: repo?.openIssuesCount.toString() ?? '',
                                ),

                                // START COUNT
                                IconTextChip(
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
            } else {
              // SHOW LOADER IF FETCHING IN PROGRESS
              return FutureBuilder(
                future: _fetchRepos(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {

                    // LOADER IF FETCH IN PROGRESS
                    case ConnectionState.none:
                    case ConnectionState.active:
                    case ConnectionState.waiting:
                      return Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 9.0),
                          child: CircularProgressIndicator(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      );

                    // EMPTY CONTAINER IF DONE
                    case ConnectionState.done:
                      return Container();
                  }
                },
              );
            }
          },

          // DIVIDER
          separatorBuilder: (context, index) {
            return const Divider(
              height: 0,
            );
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../controller/repo_controller.dart';
import '../../data/models/repo.dart';
import '../../utils/my_hive_constants.dart';
import '../widgets/icon_text_chip.dart';

// ignore: must_be_immutable
class RepoListView extends StatelessWidget {
  RepoListView({Key? key}) : super(key: key);

  final Box<Repo> repoBox = Hive.box(repoBoxName);
  // FUTURE HOLDING VARIABLE (to show loader)
  Future<void>? _fetchRepos;

  @override
  Widget build(BuildContext context) {
    // CALLING FETCH REPOS ON FIRST APP LAUNCH
    if (repoBox.length == 0) {
      _fetchRepos = RepoController.instance.fetchRepos();
    }

    // HIVE WILL REBUILD THIS, IF DATA ADDED
    return ValueListenableBuilder(
      valueListenable: repoBox.listenable(),
      builder: (ctx, box, _) {
        return ListView.separated(
          itemCount: repoBox.length + 1,
          itemBuilder: (context, index) {
            // CALLING FETCH REPOS WHEN LAST 3RD ITEM IS RENDERED
            if (index == repoBox.length - 3) {
              _fetchRepos = RepoController.instance.fetchRepos();
            }

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
                  future: _fetchRepos,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    // LOADER IF FETCH IN PROGRESS
                    return (snapshot.connectionState == ConnectionState.waiting)
                        ? Center(
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 9.0),
                              child: CircularProgressIndicator(
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          )
                        // EMPTY CONTAINER IF DONE
                        : Container();
                  });
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

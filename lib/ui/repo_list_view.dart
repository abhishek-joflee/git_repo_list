import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/models/repo.dart';
import '../logic/repo_controller.dart';
import '../utils/my_hive_constants.dart';
import 'list_tile_subtitle_icon_and_text.dart';

class RepoListView extends StatefulWidget {
  const RepoListView({Key? key}) : super(key: key);

  @override
  State<RepoListView> createState() => _RepoListViewState();
}

class _RepoListViewState extends State<RepoListView> {
  final RepoController repoController = RepoController();

  bool isFetching = false;

  final Box<Repo> repoBox = Hive.box(repoBoxName);

  void _handlePagination() async {
    setState(() {
      isFetching = true;
    });
    await repoController.fetchRepos();
    setState(() {
      isFetching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // HIVE WILL REBUILD THIS, IF DATA ADDED
    return ValueListenableBuilder(
      valueListenable: repoBox.listenable(),
      builder: (ctx, box, _) {
        // NOTIFICATION LISTENER (for pagination)
        return NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            if (!isFetching &&
                scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
              _handlePagination();
            }
            return true;
          },
          child: ListView.separated(
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
                                    text:
                                        repo?.openIssuesCount.toString() ?? '',
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
              } else {
                // SHOW LOADER IF FETCHING IN PROGRESS
                return isFetching
                    ? Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 9.0),
                          child: CircularProgressIndicator(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      )
                    : Container();
              }
            },
            separatorBuilder: (context, index) {
              return const Divider(
                height: 0,
              );
            },
          ),
        );
      },
    );
  }
}

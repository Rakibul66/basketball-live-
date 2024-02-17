import 'package:flutter/material.dart';

import '../models/live_match.dart';
import 'live_match_list_item.dart';

class LiveMatchListViewBuilder extends StatelessWidget {
  final List<LiveMatch> liveMatches;

  const LiveMatchListViewBuilder({Key? key, required this.liveMatches}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (liveMatches.isEmpty) {
      return const Center(
        child: Text('No live matches found.'),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        itemCount: liveMatches.length,
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16.0),
        itemBuilder: (context, index) {
          LiveMatch liveMatch = liveMatches[index];
          return LiveMatchListItem(liveMatch: liveMatch);
        },
      ),
    );
  }
}

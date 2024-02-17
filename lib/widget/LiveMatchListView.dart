import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../models/live_match.dart';
import '../service/api_service.dart';
import 'live_match_listiew_builder.dart';

class LiveMatchListView extends StatefulWidget {
  @override
  _LiveMatchListViewState createState() => _LiveMatchListViewState();
}

class _LiveMatchListViewState extends State<LiveMatchListView> {
  late Future<List<LiveMatch>> _liveMatchesFuture;

  @override
  void initState() {
    super.initState();
    _liveMatchesFuture = ApiService.getLiveMatches();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _liveMatchesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SpinKitCircle(color: Colors.white),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          List<LiveMatch> liveMatches = snapshot.data as List<LiveMatch>;
          return LiveMatchListViewBuilder(liveMatches: liveMatches);
        }
      },
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:basketlive/constants/constants.dart';
import 'package:basketlive/models/live_match.dart';
import 'package:basketlive/screens/match_linup_screen.dart';
import 'package:basketlive/service/api_service.dart';

class LiveMatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BG,
      body: FutureBuilder(
        future: ApiService.getLiveMatches(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<LiveMatch> liveMatches = snapshot.data as List<LiveMatch>;

            if (liveMatches.isEmpty) {
              return const Center(
                child: Text('No live matches found.'),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                itemCount: liveMatches.length,
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16.0),
                itemBuilder: (context, index) {
                  LiveMatch liveMatch = liveMatches[index];

                  return GestureDetector(
                    onTap: () {
                      _showMatchDetails(context, liveMatch.matchId);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF031A22), // Card color
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Color(0xFF167562)), // Stroke color
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text('League: ${liveMatch.league}', style: TextStyle(color: Colors.white)),
                          SizedBox(width: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // Home team icon
                                  Icon(Icons.home, color: Colors.white),
                                  SizedBox(width: 8),
                                  // Home team name (limited to 8 characters)
                                  Text(
                                    liveMatch.homeTeam.length > 15 ? '${liveMatch.homeTeam.substring(0, 8)}...' : liveMatch.homeTeam,
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  // Away team name (limited to 8 characters)
                                  Text(
                                    liveMatch.awayTeam.length > 15 ? '${liveMatch.awayTeam.substring(0, 8)}...' : liveMatch.awayTeam,
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: 8),
                                  // Away team icon
                                  Icon(Icons.flight, color: Colors.white),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Home team score
                              Text('Score: ${liveMatch.homeScore}', style: TextStyle(color: Colors.white)),
                              // Away team score
                              Text('Score: ${liveMatch.awayScore}', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          // Rest of the match details
                          //Text('League ID: ${liveMatch.leagueId}', style: TextStyle(color: Colors.white)),
                       //   Text('Match ID: ${liveMatch.matchId}', style: TextStyle(color: Colors.white)),
                          Text('Status: ${liveMatch.status}', style: TextStyle(color: Colors.white)),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('Initial Odds: ${liveMatch.initialAwayOdd} | ${liveMatch.initialHomeOdd}', style: TextStyle(color: Colors.white)),
                              Text('Live Odds: ${liveMatch.liveAwayOdd} | ${liveMatch.liveHomeOdd}', style: TextStyle(color: Colors.white)),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF0C0F20), // Period section color
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('Period 1: ${liveMatch.period1Away} - ${liveMatch.period1Home}', style: TextStyle(color: Colors.white)),
                                Text('Period 2: ${liveMatch.period2Away} - ${liveMatch.period2Home}', style: TextStyle(color: Colors.white)),
                                Text('Period 3: ${liveMatch.period3Away} - ${liveMatch.period3Home}', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

void _showMatchDetails(BuildContext context, String matchId) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MatchLineupScreen(matchId: matchId)),
  );
}

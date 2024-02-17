import 'package:flutter/material.dart';

import '../models/live_match.dart';
import '../screens/match_linup_screen.dart';

class LiveMatchListItem extends StatelessWidget {
  final LiveMatch liveMatch;

  const LiveMatchListItem({Key? key, required this.liveMatch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showMatchDetails(context, liveMatch.matchId);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Color(0xFF031A22),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Color(0xFF167562)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('League: ${liveMatch.league}', style: TextStyle(color: Colors.white)),
            SizedBox(width: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _teamInfo(icon: Icons.home, name: liveMatch.homeTeam),
                _teamInfo(icon: Icons.flight, name: liveMatch.awayTeam),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Score: ${liveMatch.homeScore}', style: TextStyle(color: Colors.white)),
                Text('Score: ${liveMatch.awayScore}', style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 8.0),
            Text('Status: ${liveMatch.status}', style: TextStyle(color: Colors.white)),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Initial Odds: ${liveMatch.initialAwayOdd} | ${liveMatch.initialHomeOdd}', style: TextStyle(color: Colors.white)),
                Text('Live Odds: ${liveMatch.liveAwayOdd} | ${liveMatch.liveHomeOdd}', style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 8.0),
            _buildPeriodContainer(liveMatch),
          ],
        ),
      ),
    );
  }
  Widget _teamInfo({required IconData icon, required String name}) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        SizedBox(width: 8),
        Text(
          name.length > 15 ? '${name.substring(0, 8)}...' : name,
          style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget _buildPeriodContainer(LiveMatch liveMatch) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF0C0F20),
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
    );
  }
}

void _showMatchDetails(BuildContext context, String matchId) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MatchLineupScreen(matchId: matchId)),
  );
}
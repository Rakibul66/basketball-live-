import 'package:basketlive/constants/constants.dart';
import 'package:basketlive/models/lineup.dart';
import 'package:basketlive/service/api_service.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MatchLineupScreen extends StatefulWidget {
  final String matchId;

  MatchLineupScreen({required this.matchId});

  @override
  _MatchLineupScreenState createState() => _MatchLineupScreenState();
}

class _MatchLineupScreenState extends State<MatchLineupScreen> {
  late MatchLineup matchLineups;
  bool isLoading = true; // Variable to track loading state

  @override
  void initState() {
    super.initState();
    matchLineups = MatchLineup(matchId: '', statistics: []); // Initialize with default values
    _fetchMatchLineups();
  }

  Future<void> _fetchMatchLineups() async {
    try {
      MatchLineup fetchedLineups = await ApiService.getMatchLineups(widget.matchId);
      setState(() {
        matchLineups = fetchedLineups;
        isLoading = false; // Set loading state to false after data is fetched
      });
    } catch (e) {
      print('Error fetching match lineups: $e');
      // Handle error accordingly
      setState(() {
        isLoading = false; // Set loading state to false if there's an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BG,
      appBar: AppBar(
        backgroundColor: AppColors.bar,
        title: const Text(
          'Match Lineups',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  const Text(
                    'Player Statistics:',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 8.0),
                  for (PlayerStats player in matchLineups.statistics)
                    Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(
                          color: Color(0xFF167562),
                        ), // Stroke color
                      ),
                      color: const Color(0xFF031A22), // Card color
                      child: ListTile(
                        title: Text(
                          'Name: ${player.name}',
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Country: ${player.country}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Jersey Number: ${player.jerseyNum}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Position: ${player.position}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Team: ${player.team}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Stats: ${player.stats}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (isLoading) // Show spinner if loading
            const Center(
              child: SpinKitCircle(
                color: Colors.white,
                size: 50.0,
              ),
            ),
        ],
      ),
    );
  }
}

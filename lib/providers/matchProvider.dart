import 'package:flutter/material.dart';
import 'package:goalpost/services/matchesService.dart';


class MatchProvider with ChangeNotifier {
  List<dynamic>? _matchesList=[];
  List<dynamic>? get matchesList => _matchesList;

  Future getMatches(List<dynamic> leagueIds) async {
    print("Getting Matches");
    _matchesList = await MatchesService.getLeagueMatches(leagueIds);
    print(matchesList.toString());
  }
}

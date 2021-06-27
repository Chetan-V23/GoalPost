import 'package:flutter/material.dart';
import 'package:goalpost/services/matchesService.dart';


class MatchProvider with ChangeNotifier {
  List<dynamic>? _matchesList=[];
  List<dynamic>? get matchesList => _matchesList;

  Future getMatches() async {
    print("Getting Matches");
    _matchesList = await MatchesService.getLeagueMatches(4);
    print(matchesList.toString());
  }
}

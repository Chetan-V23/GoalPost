import 'package:flutter/cupertino.dart';
import 'package:goalpost/services/leagueServices.dart';

class LeagueProvider with ChangeNotifier{

  List<dynamic> _leagues=[];
  List<dynamic> get leagues => _leagues;

  Future<void> getLeagues()async {
    _leagues= await LeagueService.getLeagues();
    print("Leagues Updated in Provider");
    notifyListeners();
  }

}
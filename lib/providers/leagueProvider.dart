import 'package:flutter/cupertino.dart';
import 'package:goalpost/classes/userclass.dart';
import 'package:goalpost/services/leagueServices.dart';
import 'package:goalpost/services/userServices.dart';

class LeagueProvider with ChangeNotifier{

  List<dynamic> _leagues=[];
  List<dynamic> get leagues => _leagues;
  List<int> _preferedLeagueId=[];
  List<int> get preferedLeagueId=> _preferedLeagueId;

  Future<void> getLeagues()async {
    _leagues= await LeagueService.getLeagues();
    print("Leagues Updated in Provider");
    notifyListeners();
  }

  void addPreferedLeague(int id){
    if(!_preferedLeagueId.contains(id))
    {
      preferedLeagueId.add(id);
    }
  }
  void removePreferedLeague(int id){
    if(_preferedLeagueId.contains(id))
    {
      preferedLeagueId.remove(id);
    }
  }

  Future<void> updatePreferedLeagues()async {

    await UserdataService.updateUserLeagues( _preferedLeagueId);
    print("UPDATED");
  }

  void getPreferedLeagues(){

  }

}
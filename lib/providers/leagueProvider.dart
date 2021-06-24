import 'package:flutter/cupertino.dart';
import 'package:goalpost/services/leagueServices.dart';
import 'package:goalpost/services/userServices.dart';

class LeagueProvider with ChangeNotifier{

  List<dynamic> _leagues=[];
  List<dynamic> get leagues => _leagues;
  List<dynamic> _preferedLeagueId=[];
  List<dynamic> get preferedLeagueId=> _preferedLeagueId;

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
    notifyListeners();
  }
  void removePreferedLeague(int id){
    if(_preferedLeagueId.contains(id))
    {
      preferedLeagueId.remove(id);
    }
    notifyListeners();
  }

  Future<void> updatePreferedLeagues()async {

    await UserdataService.updateUserLeagues( _preferedLeagueId);
    print("UPDATED");
    notifyListeners();
  }

  Future getPreferedLeagues()async{
    print("Prefered Leagues function called");
    _preferedLeagueId= await UserdataService.getUserLeagues();
    print("Prefered Leagues have been received");
    notifyListeners();
  }
}
import 'baseAPIService.dart';
import 'package:intl/intl.dart';

class MatchesService{
  static Future<List<dynamic>> getLeagueMatches(List<dynamic> leagueIds)async{
    
    List<dynamic>? response;
    DateTime now=new DateTime.now();
    DateTime from=now.subtract(Duration(days: 5));
    DateTime to=now.add(Duration(days:5));
    print("now: "+now.toString());
    print("to: "+to.toString());
    print('from'+from.toString());
    String fromString=DateFormat('yyyy-MM-dd').format(from);
    String toString=DateFormat('yyyy-MM-dd').format(to);
    print("to toString"+toString);
    int season= now.month>7?now.year:now.year-1;
    for(var league in leagueIds){
      Map<String, dynamic> queries={
      'season': season.toString(),
    //  'league':leagueList[0], Using temp below
      'league':league.toString(),
      'to':toString.toString(),
      'from':fromString.toString(),
      'timezone':'Asia/Kolkata',
    };
    print('Sending Query');
    var innerResponse = await BaseAPIHelper.get('/v3/fixtures', queries);
    response==null?response=(innerResponse): response.add(innerResponse);
    print('Got response from server');
    }
    
    return response!;
  }
}
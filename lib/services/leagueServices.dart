
import 'baseAPIService.dart';

class LeagueService {
  static Future<List<dynamic>> getLeagues() async {

    List<dynamic> filteredList = [];
    var response = await BaseAPIHelper.get('/v3/leagues');
    bool spain=false, england=false, italy=false, france=false, germany=false;
    print("\n\nGot response");
    for(var single in response)
    {
      
      String name=single['country']['name'].toString().toLowerCase();
      if(spain==false&&name=='spain')
      {
        spain=true;
;
        filteredList.add(single['league']);
      }
      else if(england==false&&name=='england')
      {
        england=true;
        filteredList.add(single['league']);
      }
      else if(germany==false&&name=='germany')
      {
        germany=true;
        filteredList.add(single['league']);
      }
      else if(france==false&&name=='france')
      {
        france=true;
        filteredList.add(single['league']);
      }
      else if(italy==false&&name=='italy')
      {
        italy=true;
        filteredList.add(single['league']);
      }
      if(france&&spain&&germany&&italy&&england)
      {
        break;
      }
    }
    print("Everything is filtered");
    //print(filteredList.toString());
    return filteredList;
  }
}

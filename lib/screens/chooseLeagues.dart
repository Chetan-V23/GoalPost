import 'package:flutter/material.dart';
import 'package:goalpost/modals/sacffoldObjects.dart';
import 'package:goalpost/modals/tiles.dart';
import 'package:provider/provider.dart';
import 'package:goalpost/providers/leagueProvider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChooseLeagues extends StatefulWidget {
  const ChooseLeagues({Key? key}) : super(key: key);

  @override
  _ChooseLeaguesState createState() => _ChooseLeaguesState();
}

class _ChooseLeaguesState extends State<ChooseLeagues>
    with SingleTickerProviderStateMixin {

  List<dynamic>? leagueList;
  void initState() {
    // TODO: implement initState
    getLeagues();
    super.initState();
  }

  Future<void> getLeagues() async {
    //Provider.of(context)<LeagueProvider>()
    var provider=Provider.of<LeagueProvider>(context, listen: false);
    if(provider.leagues.isNotEmpty)
    setState(() {
      leagueList=provider.leagues;
    });
    else{
        await Provider.of<LeagueProvider>(context, listen: false).getLeagues();
        print("Leagues Updated in Choose leagues");
        setState(() {
          leagueList=provider.leagues;
        });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: SafeArea(
        child: leagueList!=null ?
             ListView.builder(itemBuilder: (BuildContext context, int index) {
                return LeagueTile(
                    league: leagueList![index]);
              },
              itemCount: leagueList!.length ,)
            : SpinKitWave(
                color: Colors.white,
                size: 50.0,
                controller: AnimationController(
                    vsync: this, duration: const Duration(milliseconds: 1200)),
              ),
      ),
    );
  }
}

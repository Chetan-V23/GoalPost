import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goalpost/modals/sacffoldObjects.dart';
import 'package:goalpost/modals/leaguetile.dart';
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
  bool preferedLeaguesPresent = false;
  bool ready=false;
  void initState() {

    getInitialData();
    super.initState();
  }

  Future<void> getInitialData() async {
    var provider = Provider.of<LeagueProvider>(context, listen: false);
    if (provider.preferedLeagueId.isNotEmpty)
      preferedLeaguesPresent = true;
    else {
      await provider.getPreferedLeagues();
      print("Prefered Leagues Updated in Choose leagues");
      preferedLeaguesPresent = true;
    }
    if (provider.leagues.isNotEmpty)
      leagueList = provider.leagues;
    else {
      await Provider.of<LeagueProvider>(context, listen: false).getLeagues();
      print("Leagues Updated in Choose leagues");
      leagueList = provider.leagues;
    }
    if(preferedLeaguesPresent==true && provider.leagues.isNotEmpty)
    {
      setState(() {
        ready=true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        margin: EdgeInsets.fromLTRB(0, 0, 10, 20),
        child: FloatingActionButton(
          onPressed: () {
            var provider = Provider.of<LeagueProvider>(context, listen: false);
            provider.updatePreferedLeagues();
            Navigator.of(context).pushNamed('/chooseTeams');
          },
          backgroundColor: Colors.green[900],
          child: Icon(
            Icons.arrow_right_alt,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SafeArea(
        child: leagueList != null
            ? Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF121212),
                      ),
                      padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select Your Leagues',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                  Expanded(
                    child: ListView.builder(
                      addAutomaticKeepAlives: true,
                      //shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return LeagueTile(league: leagueList![index]);
                      },
                      itemCount: leagueList!.length,
                    ),
                  ),
                ],
              )
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

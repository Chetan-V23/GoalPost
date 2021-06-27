import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:goalpost/modals/sacffoldObjects.dart';
import 'package:goalpost/modals/skippedLeagueTile.dart';
import 'package:provider/provider.dart';
import 'package:goalpost/providers/leagueProvider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class SkippedChooseLeagues extends StatefulWidget {
  const SkippedChooseLeagues({Key? key}) : super(key: key);

  @override
  _SkippedChooseLeaguesState createState() => _SkippedChooseLeaguesState();
}

class _SkippedChooseLeaguesState extends State<SkippedChooseLeagues>
    with SingleTickerProviderStateMixin {
  List<dynamic>? leagueList;
  bool ready=false;
  void initState() {

    getInitialData();
    super.initState();
  }

  Future<void> getInitialData() async {
    var provider = Provider.of<LeagueProvider>(context, listen: false);
    
    if (provider.leagues.isNotEmpty)
      leagueList = provider.leagues;
    else {
      await Provider.of<LeagueProvider>(context, listen: false).getLeagues();
      print("Leagues Updated in Choose leagues");
      leagueList = provider.leagues;
    }
    if( provider.leagues.isNotEmpty)
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
                        return SkippedLeagueTile(league: leagueList![index]);
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

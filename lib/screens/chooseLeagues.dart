import 'dart:ui';

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
    var provider = Provider.of<LeagueProvider>(context, listen: false);
    if (provider.leagues.isNotEmpty)
      setState(() {
        leagueList = provider.leagues;
      });
    else {
      await Provider.of<LeagueProvider>(context, listen: false).getLeagues();
      print("Leagues Updated in Choose leagues");
      setState(() {
        leagueList = provider.leagues;
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
          onPressed: () {},
          backgroundColor: Colors.green[900],
          child: Icon(Icons.arrow_right_alt, size: 40,),
          
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

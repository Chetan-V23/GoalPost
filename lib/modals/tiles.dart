import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:goalpost/providers/leagueProvider.dart';

class LeagueTile extends StatefulWidget {
  const LeagueTile({Key? key, required this.league}) : super(key: key);
  final Map<dynamic, dynamic>? league;


  @override
  State<LeagueTile> createState() => _LeagueTileState();
}

class _LeagueTileState extends State<LeagueTile> with AutomaticKeepAliveClientMixin {
  bool selected=false;
  
  @override
  Widget build(BuildContext context) {

  var provider = Provider.of<LeagueProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.fromLTRB(15,5,15,5),
      child: GestureDetector(
        child: ListTile(
        minVerticalPadding: 30,
       tileColor: selected==true?Colors.green:Color(0xFF121212),
      //   tileColor: selected==true?Colors.green:Colors.blue,
          leading: Image.network(
            widget.league!['logo'],
            height: 50,
            width: 50,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            widget.league!['name'],
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: (){
          if(selected)
          {
            provider.removePreferedLeague(widget.league!['id']);
          }
          else
          {
            provider.addPreferedLeague(widget.league!['id']);
          }
          setState(() {
            selected=!selected;
          });
        },
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}

class TeamTile extends StatefulWidget {
  const TeamTile({Key? key, required this.team}) : super(key: key);
  final Map<dynamic, dynamic>? team;


  @override
  State<TeamTile> createState() => _TeamTileState();
}

class _TeamTileState extends State<TeamTile> with AutomaticKeepAliveClientMixin {
  bool selected=false;
  
  @override
  Widget build(BuildContext context) {

  var provider = Provider.of<LeagueProvider>(context, listen: false);
    return Padding(
      padding: EdgeInsets.fromLTRB(15,5,15,5),
      child: GestureDetector(
        child: ListTile(
        minVerticalPadding: 30,
       tileColor: selected==true?Colors.green:Color(0xFF121212),
      //   tileColor: selected==true?Colors.green:Colors.blue,
          leading: Image.network(
            widget.team!['logo'],
            height: 50,
            width: 50,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            widget.team!['name'],
            style: TextStyle(color: Colors.white),
          ),
        ),
        onTap: (){
          if(selected)
          {
        //    provider.removePreferedTeam(widget.team!['id']);
          }
          else
          {
          //  provider.addPreferedTeam(widget.team!['id']);
          }
          setState(() {
            selected=!selected;
          });
        },
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}
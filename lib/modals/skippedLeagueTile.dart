import 'dart:ui';
import 'package:goalpost/routes/routeConstants.dart';
import 'package:goalpost/routes/arguements.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:goalpost/providers/leagueProvider.dart';

class SkippedLeagueTile extends StatefulWidget {
  const SkippedLeagueTile({Key? key, required this.league}) : super(key: key);
  final Map<dynamic, dynamic>? league;


  @override
  State<SkippedLeagueTile> createState() => _SkippedLeagueTileState();
}

class _SkippedLeagueTileState extends State<SkippedLeagueTile> with AutomaticKeepAliveClientMixin {
  bool selected=false;

  @override
  void initState() {
     var provider = Provider.of<LeagueProvider>(context, listen: false);
    if(provider.preferedLeagueId.contains(widget.league!['id']))
      selected=true;
    super.initState();
  }
  
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
          Navigator.of(context).pushNamed(showMatchesRoute, arguments: MatchArgs([widget.league!['id']]));
        },
      ),
    );
  }
  @override
  bool get wantKeepAlive => true;
}


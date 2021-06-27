import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:flutter/material.dart';
import 'package:goalpost/modals/matchTile.dart';
import 'package:goalpost/modals/sacffoldObjects.dart';
import 'package:goalpost/providers/matchProvider.dart';
import 'package:provider/provider.dart';

class ShowMatches extends StatefulWidget {
  const ShowMatches({Key? key}) : super(key: key);

  @override
  _ShowMatchesState createState() => _ShowMatchesState();
}

class _ShowMatchesState extends State<ShowMatches>
    with SingleTickerProviderStateMixin {
  bool ready = false;

  @override
  void initState() {
    print("in init state");
    getMatches();
    super.initState();
  }

  void getMatches() async {
    print("in get Matches");
    var provider = Provider.of<MatchProvider>(context, listen: false);
    if (provider.matchesList!.isEmpty) {
      print("In if statement");
      await provider.getMatches();
      setState(() {
        ready = true;
      });
    } else {
      print("In else statement");
      setState(() {
        ready = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MatchProvider>(context, listen: false);
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: SafeArea(
        child: ready == true
            ? Column(
                children: [
                  // Text(
                  //   provider.matchesList.toString(),
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  Expanded(
                    child: ListView.builder(
                      addAutomaticKeepAlives: true,
                      itemBuilder: (BuildContext context, int index) {
                        return MatchTile(match: provider.matchesList![index]);
                      },
                      itemCount: provider.matchesList!.length,
                    ),
                  )
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

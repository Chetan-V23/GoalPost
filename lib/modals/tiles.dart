import 'dart:ui';

import 'package:flutter/material.dart';

class LeagueTile extends StatelessWidget {
  const LeagueTile({Key? key, required this.league}) : super(key: key);
  final Map<dynamic, dynamic>? league;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: ListTile(
        leading: Image.network(league!['logo'], height: 50, width: 50,),
        title: Text(league!['name'],style: TextStyle(color: Colors.white),),
      ),
    );
  }
}

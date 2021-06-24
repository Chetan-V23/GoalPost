import 'package:flutter/material.dart';
import 'package:goalpost/modals/sacffoldObjects.dart';

class ShowMatches extends StatefulWidget {
  const ShowMatches({Key? key}) : super(key: key);

  @override
  _ShowMatchesState createState() => _ShowMatchesState();
}

class _ShowMatchesState extends State<ShowMatches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({ Key? key }) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Container(child: Text('Whoops'),),),
    );
  }
}
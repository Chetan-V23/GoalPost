import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

AppBar appBar = AppBar(
    title: Padding(
  child: Text('GOALPOST'),
  padding: EdgeInsets.fromLTRB(5, 3, 3, 3),
));


Drawer drawer =Drawer(child: Scaffold(body: SafeArea(child: Text('hi'),),),);

void showError(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
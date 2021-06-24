import 'package:flutter/material.dart';

class MatchProvider with ChangeNotifier{

  List<dynamic>? _matchesList;
  List<dynamic>? get matchesList => _matchesList;
  
}
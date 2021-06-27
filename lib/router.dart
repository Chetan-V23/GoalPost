import 'package:flutter/material.dart';
import 'package:goalpost/screens/chooseLeagues.dart';
import 'package:goalpost/screens/loginScreen.dart';
import 'package:goalpost/screens/showMatches.dart';
import 'package:goalpost/screens/signupScreen.dart';
import 'package:goalpost/screens/skippedChooseLeagues.dart';
import 'package:goalpost/screens/startScreen.dart';
import 'routes/routeConstants.dart';
import 'routes/arguements.dart';


Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case startScreenRoute:
      return MaterialPageRoute(builder: (context) => StartScreen());
    case loginScreenRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case signUpScreenRoute:
      return MaterialPageRoute(builder: (context) => SignUp());
    case chooseLeaguesRoute:
      return MaterialPageRoute(builder: (context) => ChooseLeagues());
    case showMatchesRoute:
            var args=settings.arguments as MatchArgs;
      return MaterialPageRoute(builder: (context) => ShowMatches(leagueIds: args.leagueIds,));
    case skippedChooseLeaguesRoute:
      return MaterialPageRoute(builder: (context) => SkippedChooseLeagues());
    default:
      return MaterialPageRoute(builder: (context) => StartScreen());
  }
}

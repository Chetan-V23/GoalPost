import 'package:flutter/material.dart';
import 'package:goalpost/providers/matchProvider.dart';
import 'package:goalpost/screens/chooseLeagues.dart';
import 'package:provider/provider.dart';
import 'screens/startScreen.dart';
import 'screens/loginscreen.dart';
import 'screens/errorScreen.dart';
import 'screens/loadingScreen.dart';
import 'screens/signupScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'providers/leagueProvider.dart';
import 'screens/showMatches.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  // Create the initialization Future outside of `build`:
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return SomethingWentWrong();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          //return GoalPost();
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => LeagueProvider()),
              ChangeNotifierProvider(create: (_) => MatchProvider()),
            ],
            child: GoalPost(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Loading();
      },
    );
  }
}

class GoalPost extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',

        //theme
        theme: ThemeData(
          primaryColor: Color(0xFF121212), //to be changed
          scaffoldBackgroundColor: Color(0xFF121212),
          //accentColor: Color(0xFF404040),
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Color(0xFF121212),
            ),
            bodyText1: TextStyle(
              color: Color(0xFF121212),
            ),
          ),
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              elevation: 3,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              backgroundColor: Color(0xFF404040),
              primary: Color(0xFF181818), //fill colour
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                color: Color(0xFF121212),
              ),
            ),
          ),
        ),

        //routes:

        initialRoute: '/',
        routes: {
          '/': (context) => StartScreen(),
          '/login': (context) => LoginScreen(),
          '/signUp': (context) => SignUp(),
          '/chooseLeagues': (context) => ChooseLeagues(),
          '/showMatches': (context) => ShowMatches(),
        });
  }
}

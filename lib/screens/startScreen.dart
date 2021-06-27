import 'package:flutter/material.dart';
import 'package:goalpost/modals/buttons.dart';
import 'package:goalpost/modals/sacffoldObjects.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';



class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();

}


class _StartScreenState extends State<StartScreen> {

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      //r backgroundColor:  Color(0xFF404040),
      body: SafeArea(
        child: AnimationLimiter(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: AnimationConfiguration.toStaggeredList(
                duration: Duration(milliseconds: 500),
                childAnimationBuilder: (widget) => SlideAnimation(
                  verticalOffset: 100.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: [
                  Hero(
                    tag: 1,
                    child: MenuButtons(
                      text: 'Login',
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Hero(
                      tag: 2,
                      child: MenuButtons(text: 'Sign Up', onPressed: () {
                        Navigator.of(context).pushNamed('/signUp');
                      })),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          color: Color(0xFF404040),
                          fontSize: 20,
                          decoration: TextDecoration.underline),
                    ),
                    onPressed: ()  async {
                     // var message=await LeagueService.getLeagues();
                     print("Pressed skip");
                      Navigator.of(context).popAndPushNamed('/showMatches');
                      //print(message);                    
                    },
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // ElevatedButton(onPressed: (){}, child: Text('Login', style: Theme.of(context).textTheme.bodyText1,)),
//               // ElevatedButton(onPressed: (){}, child: Text('Sign Up', style:Theme.of(context).textTheme.bodyText1))
//               MenuButtons(text: 'Login',onPressed: (){},),
//               SizedBox(height: 20,),
//               MenuButtons(text: 'Register', onPressed: (){})
//             ],
//           ),

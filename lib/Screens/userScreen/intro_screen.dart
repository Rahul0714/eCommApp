import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'auth_decide_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title: "Welcome to STORE_NAME",
          body:"We Sell The Best Quality Products!",
          image: Image.asset("images/bunny_monochromatic.png"),
        ),
        PageViewModel(
          title: "Welcome to STORE_NAME",
          body:"We Sell The Best Quality Products!",
          image: Image.asset("images/bunny_monochromatic.png"),
        ),
        PageViewModel(
          title: "Welcome to STORE_NAME",
          body:"We Sell The Best Quality Products!",
          image: Image.asset("images/bunny_monochromatic.png"),
        ),
    ], 
    onDone: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthDecide()));
    },
    onSkip: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthDecide()));
    },
    showSkipButton: true,
    skip: const Icon(Icons.skip_next,size: 40,),
    //showNextButton: true, 
    next: const Icon(Icons.arrow_forward_ios),
    done: Text("Done")
    );
  }
}
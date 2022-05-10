import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:marketo/constants/colors.dart';
import 'package:marketo/screens/welcome.dart';

class Splash extends StatefulWidget {
  const Splash({ Key? key }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {

    bool isVisible = true;

    Future.delayed(const Duration(seconds: 5), (){
        Navigator.push(context, MaterialPageRoute(builder: ((context) => const Welcome())));
    });

    return Scaffold(
      backgroundColor: blue,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 40),

          Container(
            alignment: Alignment.center,
            child: ShaderMask(
              blendMode: BlendMode.srcIn,
              shaderCallback: (rect) => LinearGradient(
                colors: [white, grey], 
                begin: Alignment.centerLeft, 
                end: Alignment.centerRight
              ).createShader(rect),
              child: const Text(
                'marketo', 
                style: TextStyle(
                  fontSize: 60, 
                  fontWeight: FontWeight.w400, 
                  fontFamily: 'Quicksand',
                  // wordSpacing: 10
                )
              ),
            ),
          ),

          
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: isVisible,
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: SpinKitThreeInOut(
                color: white,
                size: 30,
              ),
            ),
          )  
        ],
      ),
    );
  }
}
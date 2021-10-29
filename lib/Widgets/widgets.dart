import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:intro_screen/onboarding1.dart';
import 'package:intro_screen/onboarding2.dart';
import 'package:intro_screen/onboarding3.dart';
import 'package:intro_screen/onboarding4.dart';
import 'package:introduction_screen/introduction_screen.dart';
class Onboard extends StatelessWidget {
   List<PageViewModel> getPages(){
     return [
       PageViewModel(
         title: 'Q',
         bodyWidget: Onboarding1()
       ),
       PageViewModel(
           title: 'Q',
           bodyWidget: Onboarding2()
       ),
       PageViewModel(
           title: 'Q',
           bodyWidget: Onboarding3()
       ),
       PageViewModel(
           title: 'Q',
           bodyWidget: Onboarding4()
       ),

   ];
   }

// Outside build method
  PageController controller = PageController();



  @override
  Widget build(BuildContext context) {
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark, statusBarColor: Colors.transparent));
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              children: <Widget>[
                Onboarding1(),
                Onboarding2(),
                Onboarding3(),
                Onboarding4()
              ],

              controller: controller,
            ),
             Padding(
               padding: const EdgeInsets.only(bottom: 10),
               child: SmoothPageIndicator(controller: controller, count: 4,effect: ExpandingDotsEffect(
                 dotColor: Colors.grey,
                 activeDotColor: Colors.white,
                 dotHeight:10,
                 dotWidth: 10,
               ),),
             ),

          ],
        ),

      ),
    );
  }
}






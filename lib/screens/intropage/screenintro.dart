// import 'package:flutter/material.dart';
// import 'package:walletx/global_things/text.dart';
// import 'package:walletx/screens/homepage/navigationscreen.dart';
// import 'package:walletx/screens/intropage/intro_widgets/buttonwidgets.dart';

// class ScreenIntro extends StatelessWidget {
//   const ScreenIntro({Key? key}) : super(key: key);
//   final Color color = Colors.white;

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: color,
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               Container(
//                 width: width / 1.5,
//                 height: height / 3.0,
//                 decoration: const BoxDecoration(
//                     image: DecorationImage(
//                         fit: BoxFit.fill,
//                         image:
//                             AssetImage("assets/lottie/images/walletx 1.jpeg"))),
//               ),
//               const TextWidgets(
//                   text: 'Budget Your Money',
//                   textsize: 30,
//                   textFontWeight: FontWeight.bold,
//                   textcolor: Colors.black),
//               const SizedBox(height: 20),
//               const Padding(
//                 padding: EdgeInsets.only(left: 20),
//                 child: TextWidgets(
//                     textAlign: TextAlign.center,
//                     text:
//                         'Build healthy financial habits.Control unnecessary expenses.',
//                     textsize: 20,
//                     textFontWeight: FontWeight.normal,
//                     textcolor: Colors.grey),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 300),
//                 child: ButtonWidgets(
//                   buttonTextSize: 20,
//                   buttonColor: Colors.white,
//                   buttonAction: () {
//                     Navigator.of(context).pushReplacement(MaterialPageRoute(
//                         builder: (context) => const ScreenNavigation()));
//                   },
//                   buttonText: 'START NOW',
//                   buttonTextColor: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

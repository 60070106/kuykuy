import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ofp_flutter/page/download/downloadPage.dart';
import 'package:ofp_flutter/page/main/mainPage.dart';
import 'package:ofp_flutter/page/ofp/ofpPage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

void main() {
  Widget defaultHome = MainPage();
  runApp(MainApp(home: defaultHome));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarBrightness: Brightness.dark
  ));
}

class MainApp extends StatelessWidget {
  // This widget is the root of your application.
  final Widget home;
  

  MainApp({Key key, this.home});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: home,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MainPage.routeName:
            return PageTransition(
                child: MainPage(),
                type: PageTransitionType.rightToLeft,
                duration: Constants.PAGE_TRANSITION_DURATION,
                reverseDuration: Constants.PAGE_TRANSITION_DURATION);
            break;
          case DownloadPage.routeName:
            return PageTransition(
                child: DownloadPage(),
                type: PageTransitionType.rightToLeft,
                duration: Constants.PAGE_TRANSITION_DURATION,
                reverseDuration: Constants.PAGE_TRANSITION_DURATION);
            break;
          case OFPPage.routeName:
            final OFPPageArguments args = settings.arguments;
            return PageTransition(
                child: OFPPage(flightNumber: args.flightNumber,),
                type: PageTransitionType.rightToLeft,
                duration: Constants.PAGE_TRANSITION_DURATION,
                reverseDuration: Constants.PAGE_TRANSITION_DURATION);

          default:
            return PageTransition(
                child: MainPage(),
                type: PageTransitionType.rightToLeft,
                duration: Constants.PAGE_TRANSITION_DURATION,
                reverseDuration: Constants.PAGE_TRANSITION_DURATION);
            break;
        }
      },
    );
  }
}

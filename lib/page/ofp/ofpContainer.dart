import 'package:flutter/material.dart';
import 'package:ofp_flutter/widget/customAppBar.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class OFPPage extends StatefulWidget {
  static const routeName = '/ofppage';
  final String flightNumber;
  OFPPage({Key key, this.flightNumber}) : super(key: key);

  @override
  _OFPPageState createState() => _OFPPageState();
}

class _OFPPageState extends State<OFPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,

        body: SafeArea(
      child: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.black,
          child: Column(
            children: [
              CustomAppBar(
                header : "OFP Container",
                backButtonEnabled: true,
              ),
              Expanded(
                child: Container(
                    color: Constants.BLACK_2,
                    child: Center(
                      child: Text(widget.flightNumber),
                    )),
              )
            ],
          ),
        )
    ));
  }
}

class OFPPageArguments {
  final String flightNumber;

  OFPPageArguments({@required this.flightNumber});
}
import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class EnrouteTab extends StatefulWidget {
  static const String routeName = "/homepage";
  EnrouteTab({Key key}) : super(key: key);

  @override
  _EnrouteTabState createState() => _EnrouteTabState();
}

class _EnrouteTabState extends State<EnrouteTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    color: Constants.BLACK_3,
                    child: Center (child: Text('En-Route'),))
              )
            ],
          ),
        );
  }
}

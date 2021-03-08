import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class InfoTab extends StatefulWidget {
  static const String routeName = "/homepage";
  InfoTab({Key key}) : super(key: key);

  @override
  _InfoTabState createState() => _InfoTabState();
}

class _InfoTabState extends State<InfoTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    color: Constants.BLACK_3,
                    child: Center (child: Text('Information'),))
              )
            ],
          ),
        );
  }
}

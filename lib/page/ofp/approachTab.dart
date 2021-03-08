import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class ApproachTab extends StatefulWidget {
  ApproachTab({Key key}) : super(key: key);

  @override
  _ApproachTabState createState() => _ApproachTabState();
}

class _ApproachTabState extends State<ApproachTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    color: Constants.BLACK_3,
                    child: Center (child: Text('Approach'),))
              )
            ],
          ),
        );
  }
}

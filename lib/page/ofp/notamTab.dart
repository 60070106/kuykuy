import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class NotamTab extends StatefulWidget {
  NotamTab({Key key}) : super(key: key);

  @override
  _NotamTabState createState() => _NotamTabState();
}

class _NotamTabState extends State<NotamTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
          constraints: BoxConstraints.expand(),
          color: Colors.black,
          child: Column(
            children: [
              Expanded(
                child: Container(
                    color: Constants.BLACK_3,
                    child: Center(
                      child: Text('NOTAM'),
                    )),
              )
            ],
          ),
        );
  }
}

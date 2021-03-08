import 'package:flutter/material.dart';
import 'package:ofp_flutter/widget/customAppBar.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class PreflightTab extends StatefulWidget {
  static const String routeName = "/homepage";
  PreflightTab({Key key}) : super(key: key);

  @override
  _PreflightTabState createState() => _PreflightTabState();
}

class _PreflightTabState extends State<PreflightTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    color: Constants.BLACK_3,
                    child: Center (child: Text('Preflight'),))
              )
            ],
          ),
        );
  }
}

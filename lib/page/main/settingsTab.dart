import 'package:flutter/material.dart';
import 'package:ofp_flutter/widget/customAppBar.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class SettingsTab extends StatefulWidget {
  static const String routeName = "/homepage";
  SettingsTab({Key key}) : super(key: key);

  @override
  _SettingsTabState createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
          constraints: BoxConstraints.expand(),
          color: Colors.black,
          child: Column(
            children: [
              CustomAppBar(
                header : "Settings",
                backButtonEnabled: false,
              ),
              Expanded(
                child: Container(
                    color: Constants.BLACK_3,
                    child: Center(
                      child: Text('Settings'),
                    )),
              )
            ],
          ),
        );
  }
}

import 'package:flutter/material.dart';
import 'package:ofp_flutter/widget/customAppBar.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class DownloadPage extends StatefulWidget {
  static const routeName = '/download';

  DownloadPage({Key key}) : super(key: key);

  @override
  _DownloadPageState createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
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
                header : "Download Package",
                backButtonEnabled: true,
              ),
              Expanded(
                child: Container(
                    color: Constants.BLACK_2,
                    child: Center(
                      child: Text('Settings'),
                    )),
              )
            ],
          ),
        )
    ));
  }
}
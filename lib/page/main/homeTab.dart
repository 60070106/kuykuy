import 'package:flutter/material.dart';
import 'package:ofp_flutter/page/download/downloadPage.dart';
import 'package:ofp_flutter/widget/customAppBar.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;
import 'package:ofp_flutter/widget/packageBox.dart';

class HomeTab extends StatefulWidget {
  static const String routeName = "/homepage";
  HomeTab({Key key}) : super(key: key);

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              CustomAppBar(
                header : "Home",
                backButtonEnabled: false,
                rightWidget: [
                  IconButton(icon: Icon(Icons.download_sharp ), tooltip: "Download", onPressed: () {
                    Navigator.of(context).pushNamed(DownloadPage.routeName);
                  })
                ],
              ),
              Expanded(
                child: Container(
                    color: Constants.BLACK_3,
                    child: Column (children: [PackageBox()],),)
              )
            ],
          ),
        );
  }
}

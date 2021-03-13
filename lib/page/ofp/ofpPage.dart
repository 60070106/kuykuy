import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/apiService.dart';
import 'package:ofp_flutter/page/ofp/enroute/enrouteTab.dart';
import 'package:ofp_flutter/page/ofp/fuelOrderTab.dart';
import 'package:ofp_flutter/page/ofp/infoTab.dart';
import 'package:ofp_flutter/page/ofp/notamTab.dart';
import 'package:ofp_flutter/page/ofp/postFlight.dart';
import 'package:ofp_flutter/page/ofp/preflightTab.dart';
import 'package:ofp_flutter/widget/customAppBar.dart';
import 'package:ofp_flutter/class/global.dart' as Global;

class OFPPage extends StatefulWidget {
  static const routeName = '/ofppage';
  final String flightNumber;
  OFPPage({Key key, this.flightNumber}) : super(key: key);

  @override
  _OFPPageState createState() => _OFPPageState();
}

class _OFPPageState extends State<OFPPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
    loadOFP();
  }

  loadOFP() async {
    Global.currentPackage = await APIService.getOFP();
    print(Global.currentPackage.flightNumber);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
              constraints: BoxConstraints.expand(),
              color: Colors.black,
              child: Column(
                children: [
                  CustomAppBar(
                header : widget.flightNumber,
                backButtonEnabled: true,
                rightWidget: [
                  IconButton(icon: Icon(Icons.nights_stay ), tooltip: "Settings", onPressed: () {
                    //Navigator.of(context).pushNamed(DownloadPage.routeName);
                  })
                ],
              ),
              Container(
                      height: 64,
                      child: TabBar(
                        controller: _tabController,
                        indicatorColor: Colors.transparent,
                        labelColor: Colors.white.withOpacity(.8),
                        unselectedLabelColor: Colors.white24,
                        tabs: [
                          Tab(
                            child: Text('Info'),
                          ),
                          Tab(
                            child: Text('Fuel'),
                          ),
                          Tab(
                            child: Text('Pre Flight'),
                          ),
                          Tab(
                            child: Text('En-Route'),
                          ),
                          Tab(
                            child: Text('Post Flight'),
                          ),
                          Tab(
                            child: Text('NOTAM'),
                          ),
                        ],
                      )),
                  Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [InfoTab(), FuelOrderTab(), PreflightTab(), EnrouteTab(), PostFlightTab(), NotamTab()],
                    ),
                  ),
                  
                ],
              )),
        ));
  }
}

class OFPPageArguments {
  final String flightNumber;

  OFPPageArguments({@required this.flightNumber});
}

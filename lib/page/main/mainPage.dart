import 'package:flutter/material.dart';
import 'package:ofp_flutter/page/main/homeTab.dart';
import 'package:ofp_flutter/page/main/settingsTab.dart';

class MainPage extends StatefulWidget {
  static const String routeName = '/maincontainer';
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

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
              Expanded(
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: [HomeTab(), SettingsTab()],
                ),
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
                        child: Text('Home'),
                        icon: Icon(Icons.home),
                      ),
                      Tab(
                        child: Text('Settings'),
                        icon: Icon(Icons.settings),
                      ),
                    ],
                  )),
            ],
          )),
    ));
  }
}

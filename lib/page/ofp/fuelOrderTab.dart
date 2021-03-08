import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class FuelOrderTab extends StatefulWidget {
  FuelOrderTab({Key key}) : super(key: key);

  @override
  _FuelOrderTabState createState() => _FuelOrderTabState();
}

class _FuelOrderTabState extends State<FuelOrderTab> {
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
                      child: Text('Fuel Ordering'),
                    )),
              )
            ],
          ),
        );
  }
}

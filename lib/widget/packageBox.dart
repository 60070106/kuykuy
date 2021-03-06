import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;
import 'package:ofp_flutter/page/ofp/ofpContainer.dart';

class PackageBox extends StatefulWidget {
  PackageBox({Key key}) : super(key: key);

  @override
  _PackageBoxState createState() => _PackageBoxState();
}

class _PackageBoxState extends State<PackageBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(OFPPage.routeName, arguments:  OFPPageArguments(flightNumber: "TG638"));
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Constants.BLACK_1,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Column(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5))),
                          height: 8),
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Row(
                            children: [
                              Container(
                                child: Text('TG638 BKK-HKG',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                width: 140,
                              ),
                            ],
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Row(
                          children: [
                            Container(
                                child: Text('Schedule Departure',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5))),
                                width: 140),
                            Text('2020-01-01 07:00Z',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8)))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Row(
                          children: [
                            Container(
                                child: Text('Release Time',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5))),
                                width: 140),
                            Text('2020-01-01 00:00Z',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8)))
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, top: 5, bottom: 10),
                        child: Row(
                          children: [
                            Container(
                                child: Text('Downloaded Time',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.5))),
                                width: 140),
                            Text('2020-01-01 00:10Z',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8)))
                          ],
                        ),
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}

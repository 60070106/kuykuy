import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;
import 'package:ofp_flutter/class/utils.dart';
import 'package:ofp_flutter/model/ofp.dart';
import 'package:ofp_flutter/page/ofp/enroute/enrouteInput.dart';
import 'package:ofp_flutter/widget/textInputGroup.dart';
import 'package:ofp_flutter/class/global.dart' as Global;

class EnrouteTab extends StatefulWidget {
  EnrouteTab({Key key}) : super(key: key);

  @override
  _EnrouteTabState createState() => _EnrouteTabState();
}

class _EnrouteTabState extends State<EnrouteTab> {
  List<Waypoint> enrouteWaypoints;
  TextEditingController _airborneTimeController;
  TextEditingController _airborneFuelController;

  @override
  void initState() {
    super.initState();
    _airborneTimeController = TextEditingController();
    enrouteWaypoints = Global.currentPackage.enrouteWaypoints;
    Global.currentPackage.addListener(onEnrouteWaypointsChanged);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Constants.MAIN_MARGIN),
      color: Constants.BLACK_3,
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              TextInputGroup(
                header: 'AIRBORNE TIME',
                onSubmittedCallback: onAirborneTimeSubmitted,
                width: 220,
                controller: _airborneTimeController,
                inputType: TextInputType.number,
              ),
              TextInputGroup(
                header: 'AIRBORNE FUEL',
                maxLength: 6,
                width: 220,
                controller: _airborneFuelController,
                inputType: TextInputType.number,
              ),
            ],
          ),
          Row(
            children: [
              TextInputGroup(
                header: 'TOC FL',
                width: 220,
                controller: _airborneFuelController,
                inputType: TextInputType.number,
              ),
              TextInputGroup(
                header: 'TOC FUEL',
                maxLength: 6,
                width: 220,
                controller: _airborneFuelController,
                inputType: TextInputType.number,
              ),
            ],
          ),
          getHeaderRow(),
          Expanded(
              child: ListView.builder(
                  itemCount: Global.currentPackage.enrouteWaypoints.length,
                  itemBuilder: (context, index) {
                    return (getEnrouteRow(enrouteWaypoints[index], context));
                  }))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _airborneTimeController.dispose();

    Global.currentPackage.removeListener(onEnrouteWaypointsChanged);
    super.dispose();
  }

  void onAirborneTimeSubmitted(String value) {
    List<Waypoint> _wpt = Utilities.updateWaypointETA(
        Global.currentPackage.enrouteWaypoints, value);
    Global.currentPackage.setEnrouteWaypoints(_wpt);
  }

  void onEnrouteWaypointsChanged() {
    setState(() {
      enrouteWaypoints = Global.currentPackage.enrouteWaypoints;
    });
  }

  static Container getHeaderRow() {
    return Container(
      decoration: BoxDecoration(
          color: Constants.WHITE_1.withOpacity(.05),
          border: Border.all(color: Constants.BLACK_5)),
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(children: [
        Expanded(
            flex: 3,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('AWY', style: Constants.MONOSPACE_TEXT),
              Text('RNP', style: Constants.MONOSPACE_TEXT),
              Text('MGA', style: Constants.MONOSPACE_TEXT)
            ])),
        Expanded(
            flex: 4,
            child: Column(children: [
              Text('WPT FREQ', style: Constants.MONOSPACE_TEXT),
              Text('NAME FIR', style: Constants.MONOSPACE_TEXT),
              Text('LAT/LONG', style: Constants.MONOSPACE_TEXT)
            ])),
        Expanded(
            flex: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('DIST', style: Constants.MONOSPACE_TEXT),
              Text('REMD', style: Constants.MONOSPACE_TEXT),
              Text('ACCD', style: Constants.MONOSPACE_TEXT)
            ])),
        Expanded(
            flex: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('MT', style: Constants.MONOSPACE_TEXT),
              Text('TT', style: Constants.MONOSPACE_TEXT),
              Text('VAR', style: Constants.MONOSPACE_TEXT)
            ])),
        Expanded(
            flex: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('TIME', style: Constants.MONOSPACE_TEXT),
              Text('ACCT', style: Constants.MONOSPACE_TEXT),
              Text('REMT', style: Constants.MONOSPACE_TEXT)
            ])),
        Expanded(
            flex: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('ETA', style: Constants.MONOSPACE_TEXT),
              Text('REV', style: Constants.MONOSPACE_TEXT),
              Text('ATA', style: Constants.MONOSPACE_TEXT)
            ])),
        Expanded(
            flex: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('FL', style: Constants.MONOSPACE_TEXT),
              Text('TRA', style: Constants.MONOSPACE_TEXT),
              Text('SHR', style: Constants.MONOSPACE_TEXT)
            ])),
        Expanded(
            flex: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('WIND', style: Constants.MONOSPACE_TEXT),
              Text('SAT', style: Constants.MONOSPACE_TEXT),
              Text('TDV', style: Constants.MONOSPACE_TEXT)
            ])),
        Expanded(
            flex: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('TAS', style: Constants.MONOSPACE_TEXT),
              Text('MN', style: Constants.MONOSPACE_TEXT),
              Text('G/S', style: Constants.MONOSPACE_TEXT)
            ])),
        Expanded(
            flex: 2,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text('RQRD', style: Constants.MONOSPACE_TEXT),
              Text('ACCF', style: Constants.MONOSPACE_TEXT),
              Text('FOB', style: Constants.MONOSPACE_TEXT)
            ]))
      ]),
    );
  }

  static GestureDetector getEnrouteRow(Waypoint wpt, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(EnrouteInputPage.routeName, arguments: wpt);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            border: Border(
                left: BorderSide(color: Constants.BLACK_5),
                right: BorderSide(color: Constants.BLACK_5),
                bottom: BorderSide(color: Constants.BLACK_5))),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(wpt.airway, style: Constants.MONOSPACE_TEXT),
                      Text(
                          wpt.requiredNavigationPerformance != null
                              ? wpt.requiredNavigationPerformance.toString()
                              : "",
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.minimumGridAltitude.toString().padLeft(3, "0"),
                          style: Constants.MONOSPACE_TEXT)
                    ])),
            Expanded(
                flex: 4,
                child: Column(children: [
                  Text(wpt.name, style: Constants.MONOSPACE_TEXT),
                  Text('', style: Constants.MONOSPACE_TEXT),
                  Text('${wpt.latitude} ${wpt.longitude}',
                      style: Constants.MONOSPACE_TEXT)
                ])),
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(wpt.distance.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.remainingDistance.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.accumulatedDistance.toString(),
                          style: Constants.MONOSPACE_TEXT)
                    ])),
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(wpt.magneticTrack.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.trueTrack.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.magneticVariation.toString(),
                          style: Constants.MONOSPACE_TEXT)
                    ])),
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(wpt.time.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.accumulatedTime.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.remainingTime.toString(),
                          style: Constants.MONOSPACE_TEXT)
                    ])),
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(wpt.eta,
                          style: Constants.MONOSPACE_TEXT
                              .copyWith(color: Color(0xff00ff00))),
                      Text(wpt.revisedTime.isNotEmpty ? wpt.revisedTime : "....",
                          style: Constants.MONOSPACE_TEXT
                              .copyWith(color: Color(0xff00ff00))),
                      Text(wpt.u_ata.isNotEmpty ? wpt.u_ata : "....",
                          style: Constants.MONOSPACE_TEXT
                              .copyWith(color: (wpt.u_ata == "" ? Constants.ORANGE : Constants.CYAN)))
                    ])),
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(wpt.plannedFlightLevel.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(
                          (wpt.tropopauseHeight != 0)
                              ? wpt.tropopauseHeight.toString()
                              : "",
                          style: Constants.MONOSPACE_TEXT),
                      Text((wpt.shearRate != 0) ? wpt.shearRate.toString() : "",
                          style: Constants.MONOSPACE_TEXT)
                    ])),
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(wpt.windDirection, style: Constants.MONOSPACE_TEXT),
                      Text(wpt.saturatedAirTemperature.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.temperatureDeviation.toString(),
                          style: Constants.MONOSPACE_TEXT)
                    ])),
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(wpt.trueAirSpeed.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.machNumber.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.groundSpeed.toString(),
                          style: Constants.MONOSPACE_TEXT)
                    ])),
            Expanded(
                flex: 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(wpt.requiredFuel.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.accumulatedFuel.toString(),
                          style: Constants.MONOSPACE_TEXT),
                      Text(wpt.u_fuelOnboard != null ? wpt.u_fuelOnboard.toString() : "....",
                          style: Constants.MONOSPACE_TEXT
                              .copyWith(color: wpt.u_fuelOnboard != null ? Constants.CYAN : Constants.ORANGE))
                    ]))
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;
import 'package:ofp_flutter/model/ofp.dart';
import 'package:ofp_flutter/widget/customAppBar.dart';
import 'package:ofp_flutter/widget/inputPanel.dart';
import 'package:ofp_flutter/widget/textInputGroup.dart';
import 'package:ofp_flutter/widget/textLabelGroup.dart';
import 'package:ofp_flutter/class/global.dart' as Global;

class EnrouteInputPage extends StatefulWidget {
  static const String routeName = "/enrouteInput";
  final Waypoint waypoint;
  EnrouteInputPage({Key key, this.waypoint}) : super(key: key);

  @override
  _EnrouteInputPageState createState() => _EnrouteInputPageState();
}

class _EnrouteInputPageState extends State<EnrouteInputPage> {
  TextEditingController _offsetController;
  TextEditingController _fuelOnBoardController;
  TextEditingController _fuelBurnedController;
  TextEditingController _ataController;

  @override
  void initState() {
    super.initState();
    _offsetController = TextEditingController();
    _fuelBurnedController = TextEditingController();
    _fuelOnBoardController = TextEditingController();
    _ataController = TextEditingController();
  }

  void saveWaypoint() {
    if (_ataController.text.isNotEmpty) {
      widget.waypoint.u_ata = _ataController.text;
    }

    if (_fuelOnBoardController.text.isNotEmpty) {
      widget.waypoint.u_fuelOnboard = int.parse(_fuelOnBoardController.text);
    }
    
    Global.currentPackage.updateEnrouteWaypoint(
      widget.waypoint
    );
    

  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
              constraints: BoxConstraints.expand(),
              color: Colors.black,
              child: Column(
                children: [
                  CustomAppBar(
                    prePopFunction: saveWaypoint,
                    header: widget.waypoint.name,
                    backButtonEnabled: true,
                  ),
                  Container(
                    padding: EdgeInsets.all(Constants.MAIN_MARGIN),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputPanel(header: 'TIME', children: [
                          Row(
                            children: [
                              TextLabelGroup(
                                  width: 240,
                                  header: "ETA",
                                  value: widget.waypoint.eta),
                                  TextInputGroup(
                                header: 'ATA',
                                width: 240,
                                maxLength: 4,
                                controller: _ataController,
                                inputType: TextInputType.text,
                              ),
                            ],
                          ),

                        ]),
                        InputPanel(header: 'FUEL', children: [
                          Row(
                            children: [
                              TextLabelGroup(
                                  width: 240,
                                  header: "REQUIRED FUEL",
                                  value:
                                      widget.waypoint.requiredFuel.toString()),
                              TextLabelGroup(
                                  width: 240,
                                  header: "ACCUM FUEL",
                                  value: widget.waypoint.accumulatedFuel
                                      .toString()),
                            ],
                          ),
                          Row(
                            children: [
                              TextInputGroup(
                                header: 'FOB.',
                                width: 240,
                                controller: _fuelOnBoardController,
                                maxLength: 6,
                                inputType: TextInputType.text,
                              ),
                              TextInputGroup(
                                header: 'F.BURN',
                                width: 240,
                                controller: _fuelBurnedController,
                                maxLength: 6,
                                inputType: TextInputType.text,
                              ),
                              
                            ],
                          ),
                        ]),
                        InputPanel(header: 'MISC', children: [
                          
                          Row(
                            children: [
                              TextInputGroup(
                                header: 'OFFSET',
                                width: 240,
                                controller: _offsetController,
                                maxLength: 3,
                                inputType: TextInputType.text,
                              ),
                              TextInputGroup(
                                header: 'DIRECT TO',
                                width: 240,
                                maxLength: 5,
                                controller: _offsetController,
                                inputType: TextInputType.text,
                              ),
                            ],
                          ),
                        ]),
                      ],
                    ),
                  )
                ],
              )),
        ));
  }
}

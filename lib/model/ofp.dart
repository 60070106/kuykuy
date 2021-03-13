import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/utils.dart';

class OFP with ChangeNotifier {
  String flightNumber;
  DateTime flightDate;
  Aerodrome departureAerodrome;
  Aerodrome arrivalAerodrome;
  int blockTime;
  int flightTime;
  List<Waypoint> enrouteWaypoints;

  Aircraft aircraft;
  OFP({this.flightNumber});

  OFP.fromJSON(Map<String, dynamic> json) {
    flightNumber = json["flightNumber"];
    flightDate = DateTime.fromMillisecondsSinceEpoch(json["flightDate"]);
    aircraft = Aircraft.fromJSON(json["aircraft"]);
    departureAerodrome = Aerodrome.fromJSON(json["departure_aerodrome"]);
    arrivalAerodrome = Aerodrome.fromJSON(json["arrival_aerodrome"]);
    blockTime = json["blockTime"];
    flightTime = json["flightTime"];
    enrouteWaypoints = [];

    for (Map<String, dynamic> js in json["enrouteWaypoints"]) {
      enrouteWaypoints.add(Waypoint.fromJSON(js));
    }
  }

  void setEnrouteWaypoints(List<Waypoint> waypoints) {
    enrouteWaypoints = waypoints;
    notifyListeners();
  }

  void updateEnrouteWaypoint(Waypoint waypoint) {
    for (Waypoint wpt in enrouteWaypoints) {
      if (wpt.name == waypoint.name) {
        wpt = waypoint;
        break;
      }
    }
    calculateReviseTime();
  }

  void calculateReviseTime() {
    for (var i = 1; i < enrouteWaypoints.length; i++) {
      if (enrouteWaypoints[i - 1].u_ata.isNotEmpty) {
        enrouteWaypoints[i].revisedTime = Utilities.addTime(enrouteWaypoints[i-1].u_ata, enrouteWaypoints[i].time);
      }
    }
    notifyListeners();
  }


}

class Aerodrome {
  final String icao;
  final String iata;
  final String timeZone;

  Aerodrome({this.icao, this.iata, this.timeZone});

  Aerodrome.fromJSON(Map<String, dynamic> json)
      : icao = json["icao"],
        iata = json["iata"],
        timeZone = json["timeZone"];
}

class Aircraft {
  final String registration;
  final String selCalCode;
  final String engineType;
  final double performanceFactor;
  final int maxZeroFuelWeight;
  final int maxTakeoffWeight;
  final int maxLandingWeight;

  Aircraft(
      {this.registration,
      this.selCalCode,
      this.engineType,
      this.performanceFactor,
      this.maxZeroFuelWeight,
      this.maxTakeoffWeight,
      this.maxLandingWeight});

  Aircraft.fromJSON(Map<String, dynamic> json)
      : registration = json["registration"],
        selCalCode = json["selCalCode"],
        engineType = json["engineType"],
        performanceFactor = json["performanceFactor"].toDouble(),
        maxZeroFuelWeight = json["maxZeroFuelWeight"],
        maxTakeoffWeight = json["maxTakeoffWeight"],
        maxLandingWeight = json["maxLandingWeight"];
}

class Waypoint {
  String name;
  String latitude;
  String longitude;
  double frequency;
  int distance;
  int remainingDistance;
  int accumulatedDistance;
  int magneticTrack;
  int trueTrack;
  int magneticVariation;
  int time;
  int accumulatedTime;
  int remainingTime;
  int plannedFlightLevel;
  int tropopauseHeight;
  int shearRate;
  String windDirection;
  int saturatedAirTemperature;
  int temperatureDeviation;
  int trueAirSpeed;
  double machNumber;
  int groundSpeed;
  int requiredFuel;
  int accumulatedFuel;
  int requiredNavigationPerformance;
  int minimumGridAltitude;
  String airway;

  String eta = "";
  String u_ata = "";
  String revisedTime = "";
  String u_offset = "";
  int u_fuelOnboard;

  Waypoint();

  Waypoint.fromJSON(Map<String, dynamic> json)
      : name = json["waypoint"],
        latitude = json["latitude"],
        longitude = json["longitude"],
        frequency =
            (json["frequency"] != null) ? json["frequency"].toDouble() : 0,
        distance = json["distance"].toInt(),
        remainingDistance = json["remainingDistance"].toInt(),
        accumulatedDistance = json["accumulatedDistance"].toInt(),
        magneticTrack = json["magneticTrack"].toInt(),
        trueTrack = json["trueTrack"].toInt(),
        magneticVariation = json["magneticVariation"].toInt(),
        time = json["time"].toInt(),
        accumulatedTime = json["accumulatedTime"].toInt(),
        remainingTime = json["remainingTime"].toInt(),
        plannedFlightLevel = 999,
        tropopauseHeight = (json["tropopauseHeight"] != null)
            ? json["tropopauseHeight"].toInt()
            : 0,
        shearRate = (json["shearRate"] != null) ? json["shearRate"].toInt() : 0,
        windDirection = json["windDirection"],
        saturatedAirTemperature = json["saturatedAirTemperature"].toInt(),
        temperatureDeviation = json["temperatureDeviation"].toInt(),
        trueAirSpeed = json["trueAirSpeed"].toInt(),
        machNumber = json["machNumber"].toDouble(),
        groundSpeed = json["groundSpeed"].toInt(),
        requiredFuel = json["requiredFuel"].toInt(),
        accumulatedFuel = json["accumulatedFuel"].toInt(),
        minimumGridAltitude = json["minimumGridAltitude"].toInt(),
        airway = json["airway"];
}

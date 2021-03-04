class OFP {
  final String flightNumber;
  DateTime flightDate;
  Aerodrome departureAerodrome;
  Aerodrome arrivalAerodrome;
  int blockTime;
  int flightTime;

  Aircraft aircraft;
  OFP({this.flightNumber});

  OFP.fromJSON(Map<String, dynamic> json)
      : flightNumber = json["flightNumber"],
        flightDate = DateTime.fromMillisecondsSinceEpoch(json["flightDate"]),
        aircraft = Aircraft.fromJSON(json["aircraft"]),
        departureAerodrome = Aerodrome.fromJSON(json["departure_aerodrome"]),
        arrivalAerodrome = Aerodrome.fromJSON(json["arrival_aerodrome"]),
        blockTime = json["blockTime"],
        flightTime = json["flightTime"];
}

class Aerodrome { 
  final String icao;
  final String iata;
  final String timeZone;
  
  Aerodrome({
    this.icao,
    this.iata,
    this.timeZone
  });

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

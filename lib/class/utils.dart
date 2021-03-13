import 'package:ofp_flutter/model/ofp.dart';

class Utilities {
  static List<Waypoint> updateWaypointETA (List<Waypoint> waypoints, String airborneTime) {
    List<Waypoint> res = [];
    for (Waypoint wpt in waypoints) {
      wpt.eta = addTime(airborneTime, wpt.accumulatedTime);
      res.add(wpt);
    }
    return res;
  }

  static String addTime(String time, int accumulatedTime) {
    if (time.length < 4) throw new Exception('Wrong Time format.');
    String hour = time.substring(0,2);
    String minute = time.substring(2,4);
    DateTime now = DateTime.now();
    DateTime startTime = DateTime(now.year, now.month, now.day, int.parse(hour), int.parse(minute));
    now = null;
    DateTime r = startTime.add(Duration(minutes : accumulatedTime));
    return r.hour.toString().padLeft(2, "0") + r.minute.toString().padLeft(2, "0");
  }

  static String getPlaceholderString(String placeHolderChar, int length) {
    String res = "";
    for(int i = 0; i < length; i++) {
      res += placeHolderChar;
    }

    return res;
  }
}
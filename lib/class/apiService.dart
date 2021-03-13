import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ofp_flutter/class/constants.dart' as Constants;
import 'package:ofp_flutter/model/ofp.dart';

class APIService {
  static Future<OFP> getOFP() async {
    try {
      final response = await http.get(Uri.http(Constants.ENDPOINT, "ofp/flight/tg110/2020/01/01"));
      if (response.statusCode != 200)
        throw HttpException('${response.statusCode}');

      print('ok');
      OFP _ofp = OFP.fromJSON(jsonDecode(response.body));
      return _ofp;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}

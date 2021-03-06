import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:ofp_flutter/class/constants.dart' as Constants;
import 'package:ofp_flutter/model/ofp.dart';

class APIService {
  Future<OFP> getOFP() async {
    String url = Constants.ENDPOINT + "/ofp/flight/tg110/2020/01/01";
    try {
      final response = await http.get(url);
      if (response.statusCode != 200)
        throw HttpException('${response.statusCode}');

      OFP _ofp = OFP.fromJSON(jsonDecode(response.body));
      return _ofp;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}

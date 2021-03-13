import 'package:flutter_test/flutter_test.dart';
import 'package:ofp_flutter/class/utils.dart';

void main () {
  test('Expected 1000 + 5 = 1005', () {
    expect(Utilities.addTime("1000", 5), "1005");
  });

  test('Expected 1000 + 60 = 1100', () {
    expect(Utilities.addTime("1000", 60), "1100");
  });
}
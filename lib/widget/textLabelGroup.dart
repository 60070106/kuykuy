import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class TextLabelGroup extends StatelessWidget {
  final double width;
  final String header;
  final String value;
  const TextLabelGroup(
      {Key key,
      @required this.width,
      @required this.header,
      @required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: Constants.INPUT_GROUP_HEIGHT,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(child: Text(header, style: Constants.MONOSPACE_TEXT)),
            Container(
              width: 100,
              child: Container(
                  margin: EdgeInsets.only(left: 10, right: 20),
                  child: Text(value, style: Constants.MONOSPACE_TEXT.copyWith(color : Color(0xff00ff00)), textAlign: TextAlign.right,)),
            )
          ],
        ));
  }
}

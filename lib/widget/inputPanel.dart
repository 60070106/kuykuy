import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;
import 'package:ofp_flutter/widget/textLabelGroup.dart';

class InputPanel extends StatelessWidget {
  final List<Widget> children;
  final String header;
  const InputPanel({Key key, @required this.header, @required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(header, style: Constants.MONOSPACE_TEXT.copyWith(color : Constants.BLACK_5)),
        Container(
          margin: EdgeInsets.only(bottom: 10, top: 5),
          decoration: BoxDecoration(border: Border.all(color: Constants.BLACK_5)),
          padding: EdgeInsets.all(Constants.MAIN_MARGIN),
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}

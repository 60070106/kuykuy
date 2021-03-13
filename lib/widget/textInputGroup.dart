import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;
import 'package:ofp_flutter/class/utils.dart';

class TextInputGroup extends StatelessWidget {
  final double width;
  final String header;
  final TextEditingController controller;
  final TextInputType inputType;
  final Function(String) onSubmittedCallback;
  final FocusScope node;
  final int maxLength;
  const TextInputGroup(
      {Key key,
      @required this.header,
      @required this.width,
      @required this.controller,
      this.onSubmittedCallback,
      this.node,
      this.maxLength = 4,
      this.inputType = TextInputType.text})
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
                  child: TextField(
                    onSubmitted: (value) {
                      if (onSubmittedCallback != null) {
                        onSubmittedCallback(value);
                        
                      }
                    },
                    controller: controller,
                    textAlign: TextAlign.right,
                    maxLength: maxLength,
                    style: Constants.MONOSPACE_TEXT.copyWith(
                      color: Constants.CYAN,
                    ),
                    cursorColor: Colors.white,
                    keyboardType: inputType,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                        counterText: '',
                        hintText:
                            Utilities.getPlaceholderString('.', maxLength),
                        border: InputBorder.none,
                        hintStyle: Constants.MONOSPACE_TEXT
                            .copyWith(color: Constants.ORANGE)),
                  )),
            )
          ],
        ));
  }
}

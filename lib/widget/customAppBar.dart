import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class CustomAppBar extends StatelessWidget {
  final bool backButtonEnabled;
  final String header;
  final List<Widget> rightWidget;
  const CustomAppBar({Key key, @required this.backButtonEnabled, @required this.header, this.rightWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                  child: Center(
                    child: Text(header, style : TextStyle( color: Colors.white.withOpacity(.8), fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  color: Constants.BLACK_1,
                  height: 64),
            )
          ],
        ),
        Container(
          height: 64,
          margin: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              (backButtonEnabled)
                  ? IconButton(icon: Icon(Icons.navigate_before), onPressed: () {
                    Navigator.of(context).pop();
                  })
                  : SizedBox.shrink(),
              (rightWidget != null)
                  ? Row(
                      children: rightWidget,
                    )
                  : SizedBox.shrink()
            ],
          ),
        )
      ],
    );
  }
}

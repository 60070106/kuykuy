import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/constants.dart' as Constants;

class PostFlightTab extends StatefulWidget {
  PostFlightTab({Key key}) : super(key: key);

  @override
  _PostFlightTabState createState() => _PostFlightTabState();
}

class _PostFlightTabState extends State<PostFlightTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
          constraints: BoxConstraints.expand(),
          child: Column(
            children: [
              Expanded(
                child: Container(
                    color: Constants.BLACK_3,
                    child: Center (child: Text('Post Flight'),))
              )
            ],
          ),
        );
  }
}

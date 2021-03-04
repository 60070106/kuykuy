import 'package:flutter/material.dart';
import 'package:ofp_flutter/class/apiService.dart';
import 'package:ofp_flutter/model/ofp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Demo OFP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  OFP ofp;
  APIService _apiService = APIService();

  @override
  void initState() {
    super.initState();
    _apiService.getOFP().then((value) {
      setState(() {
        this.ofp = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ofp == null
                  ? "Flight Number"
                  : "Flight Number :  ${ofp.flightNumber} ",
            ),
            Text(
              ofp == null ? "Flight Date" : "Flight Date :  ${ofp.flightDate} ",
            ),
            Text(
              ofp == null ? "Block Time" : "Block Time :  ${ofp.blockTime} ",
            ),
            Text(
              ofp == null ? "Flight Time" : "Flight Time :  ${ofp.flightTime} ",
            ),
            Text(
              ofp == null
                  ? "From - To"
                  : "${ofp.departureAerodrome.icao} - ${ofp.arrivalAerodrome.icao} ",
            ),
          ],
        ),
      ),
    );
  }
}

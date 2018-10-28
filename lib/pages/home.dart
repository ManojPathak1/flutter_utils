import 'package:flutter/material.dart';
import 'package:flutter_utils/pages/sms.dart';
import 'package:flutter_utils/pages/installedApps.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    this.initPlatform();
  }

  void initPlatform() async {}

  @override
  Widget build(BuildContext context) {
    return (new Scaffold(
        appBar: new AppBar(title: new Text("Work with APIs")),
        body: new Center(
            child: new Column(children: [
          new RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SMS()));
            },
            child: new Text("SMS"),
            color: Colors.blueAccent,
            textColor: Colors.white,
          ),
          new RaisedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => InstalledApps()));
            },
            child: new Text("Installed Apps"),
            color: Colors.blueAccent,
            textColor: Colors.white,
          ),
        ]))));
  }
}

import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:sms/sms.dart';

class SMS extends StatefulWidget {
  @override
  _SMSState createState() => new _SMSState();
}

class _SMSState extends State<SMS> {
  String _receivedMessage = "";

  @override
  void initState() {
    super.initState();
    this.init();
  }

  void init() async {
    bool checkPermission =
        await SimplePermissions.checkPermission(Permission.ReadSms);
    if (!checkPermission) {
      await SimplePermissions.requestPermission(Permission.ReadSms);
    }
    SmsReceiver receiver = new SmsReceiver();
    receiver.onSmsReceived.listen((SmsMessage msg) {
      setState(() {
        _receivedMessage = msg.body;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (new Scaffold(
        appBar: new AppBar(title: new Text('SMS')),
        body: new Container(
            child: new Center(
                child: new Padding(
                    padding: EdgeInsets.all(20.0),
                    child: new Text(
                      _receivedMessage,
                      style: new TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ))))));
  }
}

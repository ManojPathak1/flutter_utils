import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:device_apps/device_apps.dart';

class InstalledApps extends StatefulWidget {
  @override
  _InstalledAppsState createState() => new _InstalledAppsState();
}

class _InstalledAppsState extends State<InstalledApps> {
  List _apps = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    /* SimplePermissions.checkPermission(Permission.ReadExternalStorage)
        .then((isApproved) {
      if (!isApproved) {
        SimplePermissions.requestPermission(Permission.ReadExternalStorage)
            .then((done) {
          DeviceApps.getInstalledApplications(includeSystemApps: true)
              .then((apps) {
            var tempApps = new List();
            tempApps.add(apps.length.toString());
            for (final el in apps) {
              tempApps.add(el.appName);
            }
            setState(() {
              _apps = tempApps;
            });
          });
        });
      }
    }); */

    bool checkPermission =
        await SimplePermissions.checkPermission(Permission.ReadExternalStorage);
    if (!checkPermission) {
      await SimplePermissions.requestPermission(Permission.ReadExternalStorage);
    }
    DeviceApps.getInstalledApplications(includeSystemApps: true).then((apps) {
      var tempApps = new List();
      tempApps.add(apps.length.toString());
      for (final el in apps) {
        tempApps.add(el.appName);
      }
      setState(() {
        _apps = tempApps;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return (new Scaffold(
        appBar: new AppBar(title: new Text("Installed Apps")),
        body: new SingleChildScrollView(
            child: new Container(
                child: new Center(
                    child: new Column(
          children: _apps
              .map((el) => new Text(
                    el,
                    style: new TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ))
              .toList(),
        ))))));
  }
}

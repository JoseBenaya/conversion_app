import 'package:conversion_app/dashboard_math.dart';
import 'package:conversion_app/dashboard_physics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardMenu extends StatefulWidget {
  @override
  _DashboardMenuState createState() => _DashboardMenuState();
}

class _DashboardMenuState extends State<DashboardMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Dashboard Menu')),
        backgroundColor: Colors.black,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg_app.jpg'), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.all(40),
        child: GridView.count(
          // primary: false,
          // shrinkWrap: true,
          mainAxisSpacing: 10,
          crossAxisCount: 1,
          children: <Widget>[
            GestureDetector(
              child: Card(
                margin: EdgeInsets.all(5.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MathHomePage();
                    }));
                  },
                  splashColor: Colors.green,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image(
                            image: ResizeImage(AssetImage('images/math.png'),
                                width: 100, height: 100)),
                        Text(
                          'Math',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              child: Card(
                margin: EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ConversionPage();
                    }));
                  },
                  splashColor: Colors.green,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image(
                            image: ResizeImage(AssetImage('images/physics.png'),
                                width: 100, height: 100)),
                        Text(
                          'Physics',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

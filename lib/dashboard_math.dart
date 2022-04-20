import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class MathHomePage extends StatefulWidget {
  @override
  _MathHomePageState createState() => _MathHomePageState();
}

class _MathHomePageState extends State<MathHomePage> {
  final _formkey = GlobalKey<FormState>();
  final _formkey2 = GlobalKey<FormState>();

  TextEditingController lengthcontroller = new TextEditingController();
  TextEditingController widthcontroller = new TextEditingController();

  TextEditingController lengthcontroller2 = new TextEditingController();
  TextEditingController widthcontroller2 = new TextEditingController();
  TextEditingController heightcontroller = new TextEditingController();

  String result = "0";
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            tabs: [
              Tab(
                text: "Area",
              ),
              Tab(text: "Volume"),
            ],
          ),
          title: Center(child: Text('Dashboard Math')),
          backgroundColor: Colors.black,
        ),
        body: TabBarView(
          children: [
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/bg_app.jpg'), fit: BoxFit.cover),
              ),
              child: Center(
                child: Form(
                  key: _formkey,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10, top: 10, left: 15, right: 15),
                        child: TextFormField(
                          validator: RequiredValidator(errorText: "* Required"),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          controller: lengthcontroller,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            hintText: 'Length',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.brown[400], width: 4.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue[300], width: 4.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 15, right: 15),
                        child: TextFormField(
                          validator: RequiredValidator(errorText: "* Required"),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          controller: widthcontroller,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            hintText: 'Width',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.brown[400], width: 4.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue[300], width: 4.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {
                            if (_formkey.currentState.validate()) {
                              setState(() {
                                int sum = int.parse(lengthcontroller.text) *
                                    int.parse(widthcontroller.text);
                                result = sum.toString();
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            padding: EdgeInsets.all(12.0),
                            margin: EdgeInsets.fromLTRB(80.0, 10, 80.0, 0),
                            child: Center(
                              child: Text(
                                'Calculate',
                                style: TextStyle(
                                    color: Colors.brown[300],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              "Result:",
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Container(
                              width: 235,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.brown[100],
                                  border: Border.all(
                                      color: Colors.orange, width: 3)),
                              child: Center(
                                child: Text(
                                  result,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/bg_app.jpg'), fit: BoxFit.cover),
              ),
              child: Center(
                child: Form(
                  key: _formkey2,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 10, top: 10, left: 15, right: 15),
                        child: TextFormField(
                          validator: RequiredValidator(errorText: "* Required"),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          controller: lengthcontroller2,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            hintText: 'Length',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.brown[400], width: 4.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue[300], width: 4.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 15, right: 15),
                        child: TextFormField(
                          validator: RequiredValidator(errorText: "* Required"),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          controller: widthcontroller2,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            hintText: 'Width',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.brown[400], width: 4.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue[300], width: 4.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: 10, left: 15, right: 15),
                        child: TextFormField(
                          validator: RequiredValidator(errorText: "* Required"),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          keyboardType: TextInputType.number,
                          controller: heightcontroller,
                          decoration: InputDecoration(
                            fillColor: Colors.grey,
                            filled: true,
                            hintText: 'Height',
                            hintStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.brown[400], width: 4.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.blue[300], width: 4.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: GestureDetector(
                          onTap: () {
                            if (_formkey2.currentState.validate()) {
                              setState(() {
                                int sum = int.parse(lengthcontroller2.text) *
                                    int.parse(widthcontroller2.text) *
                                    int.parse(heightcontroller.text);
                                result = sum.toString();
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[350],
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            padding: EdgeInsets.all(12.0),
                            margin: EdgeInsets.fromLTRB(80.0, 10, 80.0, 0),
                            child: Center(
                              child: Text(
                                'Calculate',
                                style: TextStyle(
                                    color: Colors.brown[300],
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text(
                              "Result:",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 30),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Container(
                              width: 230,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.brown[100],
                                  border: Border.all(
                                      color: Colors.orange, width: 3)),
                              child: Center(
                                child: Text(
                                  result,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'convert_util.dart';

class ConversionPage extends StatefulWidget {
  @override
  ConversionPageState createState() => ConversionPageState();
}

class ConversionPageState extends State<ConversionPage> {
  final _formkey3 = GlobalKey<FormState>();

  double _numberFrom = 0;
  String _startMeasure;
  String _convertedMeasure;
  double _result = 0;
  String _resultMessage = '';

  @override
  Widget build(BuildContext context) {
    double sizeX = MediaQuery.of(context).size.width;
    double sizeY = MediaQuery.of(context).size.height;
    final TextStyle inputStyle = TextStyle(
        fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold);
    final TextStyle labelStyle = TextStyle(
        fontSize: 25, color: Colors.grey[200], fontWeight: FontWeight.w900);

    final spacer = Padding(padding: EdgeInsets.only(bottom: sizeY / 40));
    final List<String> _measures = [
      'km',
      'hm',
      'dam',
      'm',
      'dm',
      'cm',
      'mm',
    ];
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Dashboard Physics')),
        backgroundColor: Colors.black,
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg_app.jpg'), fit: BoxFit.cover),
        ),
        width: sizeX,
        padding: EdgeInsets.all(sizeX / 20),
        child: SingleChildScrollView(
            child: Form(
          key: _formkey3,
          child: Column(
            children: [
              Text(
                'Value',
                style: labelStyle,
              ),
              spacer,
              Padding(
                padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                child: TextFormField(
                  validator: RequiredValidator(errorText: "* Required"),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: inputStyle,
                  decoration: InputDecoration(
                    fillColor: Colors.grey,
                    filled: true,
                    hintText: "Insert input here",
                    hintStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.brown[400], width: 4.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.blue[300], width: 4.0),
                    ),
                  ),
                  onChanged: (text) {
                    setState(() {
                      _numberFrom = double.parse(text);
                    });
                  },
                ),
              ),
              spacer,
              Text(
                'From',
                style: labelStyle,
              ),
              spacer,
              Padding(
                padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.brown[400], width: 4.0),
                  ),
                  child: DropdownButton(
                    dropdownColor: Colors.brown[400],
                    underline: SizedBox.shrink(),
                    isExpanded: true,
                    style: inputStyle,
                    value: _startMeasure,
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(
                            value,
                            style: inputStyle,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      onStartMeasureChanged(value);
                    },
                  ),
                ),
              ),
              spacer,
              Text(
                'To',
                style: labelStyle,
              ),
              spacer,
              Padding(
                padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    border: Border.all(color: Colors.brown[400], width: 4.0),
                  ),
                  child: DropdownButton(
                    dropdownColor: Colors.brown[400],
                    underline: SizedBox.shrink(),
                    isExpanded: true,
                    style: inputStyle,
                    value: _convertedMeasure,
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(
                            value,
                            style: inputStyle,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      onConvertedMeasureChanged(value);
                    },
                  ),
                ),
              ),
              spacer,
              RaisedButton(
                child: Text('Convert',
                    style: TextStyle(
                        color: Colors.brown[300],
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                onPressed: () {
                  if (_formkey3.currentState.validate()) {
                    convert();
                  }
                },
              ),
              spacer,
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Container(
                  width: 320,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.brown[100],
                      border: Border.all(color: Colors.orange, width: 3)),
                  child: Center(
                    child: Text(
                      _resultMessage,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void onStartMeasureChanged(String value) {
    setState(() {
      _startMeasure = value;
    });
  }

  void onConvertedMeasureChanged(String value) {
    setState(() {
      _convertedMeasure = value;
    });
  }

  void convert() {
    if (_startMeasure.isEmpty ||
        _convertedMeasure.isEmpty ||
        _numberFrom == 0) {
      return;
    }
    Conversion c = Conversion();
    double result = c.convert(_numberFrom, _startMeasure, _convertedMeasure);
    setState(() {
      _result = result;
      _resultMessage = '${_result.toString()} $_convertedMeasure';
    });
  }
}

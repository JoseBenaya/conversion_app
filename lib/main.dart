import 'package:conversion_app/dashboard_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String username = "", password = "";
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text('Converter App')),
      ),
      body: Container(
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
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 35.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    validator: RequiredValidator(errorText: "* Required"),
                    keyboardType: TextInputType.text,
                    controller: usernameController,
                    decoration: InputDecoration(
                      fillColor: Colors.grey,
                      filled: true,
                      hintText: 'username',
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.brown[400], width: 4.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue[300], width: 4.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: TextFormField(
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: "* Required"),
                        MinLengthValidator(6,
                            errorText: "Password should be at least 6"),
                      ],
                    ),
                    keyboardType: TextInputType.text,
                    controller: passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      fillColor: Colors.grey,
                      filled: true,
                      hintText: 'password',
                      hintStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      suffixIcon: IconButton(
                        icon: Icon(_isObscure
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.brown[400], width: 4.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.blue[300], width: 4.0),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      username = usernameController.text;
                      password = passwordController.text;
                      if (_formkey.currentState.validate()) {
                        if (username == "belajarflutter" &&
                            password == "belajarflutter") {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DashboardMenu();
                          }));
                        }
                        if (username != "belajarflutter" &&
                            password != "belajarflutter") {
                          showDialog(
                            context: context,
                            builder: (_) => NetworkGiffyDialog(
                              image: Padding(
                                padding: EdgeInsets.only(top: 45),
                                child: Image.asset('images/cancel.png'),
                              ),
                              title: Text(
                                'Username & Password Anda salah!',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          );
                        }
                        if (username == "belajarflutter" &&
                                password != "belajarflutter" ||
                            username != "belajarflutter" &&
                                password == "belajarflutter") {
                          showDialog(
                            context: context,
                            builder: (_) => NetworkGiffyDialog(
                              image: Padding(
                                padding: EdgeInsets.only(top: 45),
                                child: Image.asset('images/cancel.png'),
                              ),
                              title: Text(
                                'Username atau Password Anda salah!',
                                style: TextStyle(
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      padding: EdgeInsets.all(12.0),
                      margin: EdgeInsets.fromLTRB(100.0, 10, 100.0, 0),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: Colors.brown[300],
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

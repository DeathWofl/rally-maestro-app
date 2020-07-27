import 'package:flutter/material.dart';
import 'package:maestros/widgets/logindeco.dart';
import 'package:maestros/widgets/sendbutton.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formGlobalKey = GlobalKey<FormState>();

  String _password;
  String _username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 70, bottom: 20, left: 30, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const loginDecoWidget(),
              Padding(
                padding: EdgeInsets.only(top: 40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Form(
                    key: _formGlobalKey,
                    autovalidate: true,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            initialValue: 'admin',
                            validator: (value) => _validateUsername(value),
                            onSaved: (newValue) {
                              setState(() {
                                 _username = newValue;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Nombre de Usuario',
                              alignLabelWithHint: true,
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                            cursorColor: Colors.grey,
                            style: TextStyle(
                              color: Color.fromRGBO(50, 104, 214, 1),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            obscureText: true,
                            initialValue: 'admin',
                            validator: (value) => _validatePassword(value),
                            onSaved: (newValue) {
                              setState(() {
                                _password = newValue;
                              });
                            },
                            decoration: InputDecoration(
                              labelText: 'Contraseña',
                              alignLabelWithHint: true,
                              floatingLabelBehavior: FloatingLabelBehavior.never,
                            ),
                            cursorColor: Colors.grey,
                            style: TextStyle(
                              color: Color.fromRGBO(50, 104, 214, 1),
                            ),
                          ),
                        ),
                        SendButtonWidget(keyFormState: _formGlobalKey, username: _username, password: _password),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  String _validatePassword(String value) {
    return value.isEmpty ? 'Necesita llenar todos los campos' : null;
  }

  String _validateUsername(String value) {
    return value.isEmpty ? 'Necesita llenar todos los campos' : null;
  }
}
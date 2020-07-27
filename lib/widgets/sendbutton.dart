import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:maestros/pages/home.dart';
import 'package:maestros/services/auth.dart';

class SendButtonWidget extends StatefulWidget {
  SendButtonWidget({Key key, this.keyFormState, this.username, this.password }) : super(key: key);

  final GlobalKey<FormState> keyFormState;
  final String username;
  final String password;

  @override
  _SendButtonState createState() => _SendButtonState();
}

class _SendButtonState extends State<SendButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),
      child: FlatButton(
        onPressed: () => _submitData(),
        color: Colors.transparent,
        child: Row(
          children: <Widget>[
            Text(
              'Comenzar',
              style: TextStyle(
                color: Color.fromRGBO(4, 4, 12, 1),
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Image(
                image: AssetImage('assets/icons/arrow.png'),
                width: 50,
              ),
            )
          ],
        )
      ),
    );
  }

  _submitData() async {
    if (widget.keyFormState.currentState.validate()) {
      widget.keyFormState.currentState.save();
      
      final redSnackbar = SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        content: Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Icon(MaterialCommunityIcons.alert_circle),
            SizedBox(width: 10),
            Text('Usuario o Contraseña incorrecta')
          ],
        )
      );

      String response = await Auth.signIn(widget.username, widget.password);
      response == '200' ? Ok(context) : Scaffold.of(context).showSnackBar(redSnackbar);

    }
  }

  void Ok(BuildContext context) {
    final greenSnackbar = SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: <Widget>[
            Icon(MaterialCommunityIcons.check_bold),
            SizedBox(width: 10),
            Text('Bienvenido')
          ],
        )
      );
    Scaffold.of(context).showSnackBar(greenSnackbar);

    Future.delayed(Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    });
  }
}


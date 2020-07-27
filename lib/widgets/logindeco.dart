import 'package:flutter/material.dart';

class loginDecoWidget extends StatelessWidget {
  const loginDecoWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Image(
            image: AssetImage("assets/icons/lock.png"),
            fit: BoxFit.cover,
            width: 60,
            color: Color.fromRGBO(33, 33, 40, 1),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(top: 30.0, bottom: 6.0),
            child: Text(
              'Bienvenido,',
              style: TextStyle(
                color: Color.fromRGBO(4, 4, 12, 1),
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Identifiquese para continuar.',
            style: TextStyle(
              color: Color.fromRGBO(50, 104, 214, 1),
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:maestros/widgets/dropdownestacions.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.maxFinite,
              height: 250,
              color: Color.fromRGBO(50, 104, 214, 1),
              child: SafeArea(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1.0, color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(9999999.0),
                      ),
                    ),
                    child: Image.asset('assets/icons/user(1).png'),
                  ),
                  Text(
                    'John Smith',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )
                ],
              )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 10.0),
              child: Container(
                alignment: Alignment.topLeft,
                width: double.infinity,
                
                child: Column(
                  children: <Widget>[
                    Text(
                      'Estacion:',
                      style: TextStyle(
                        color: Color.fromRGBO(4, 4, 12, 1),
                        fontSize: 18,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                      // child: DropEstacionsWidget(),
                      child: DropDownEstacionsWidget(),
                      // child: DropDownNormalWidget(),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

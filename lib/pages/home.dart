import 'package:flutter/material.dart';
import 'package:maestros/pages/profile.dart';
import 'package:maestros/pages/scanner.dart';

import 'package:flutter_icons/flutter_icons.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Widget _currentPage;
  int _currentIndex = 0;
  List _listPages = List();

  void _changePage(int selectedIndex) {
    setState(() {
    _currentIndex = selectedIndex;
    _currentPage = _listPages[selectedIndex];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _listPages..add(Profile())..add(Scanner());
    _currentPage = Profile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromRGBO(50, 104, 214, 1),
        currentIndex: _currentIndex,
        onTap: (selectedIndex) => _changePage(selectedIndex),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil')
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesome.qrcode),
            title: Text('Escanear')
          )
        ]
      ),
    );
  }
}
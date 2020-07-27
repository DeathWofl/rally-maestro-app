import 'package:flutter/material.dart';
import 'package:maestros/models/estacions.dart';
import 'package:maestros/services/estacion_service.dart';


class DropDownEstacionsWidget extends StatefulWidget {
  DropDownEstacionsWidget({Key key}) : super(key: key);

  @override
  _DropDownEstacionsWidgetState createState() => _DropDownEstacionsWidgetState();
}

class _DropDownEstacionsWidgetState extends State<DropDownEstacionsWidget> {

  Estacion _selectedEstacion;
  List<Estacion> estacions;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    EstacionServices.getEstacions().then((value) => _selectedEstacion = value[0]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Estacion>>(
      future: EstacionServices.getEstacions(),
      builder: (context, snapshot) {
        return snapshot.data == null ? CircularProgressIndicator() : Column(
          children: <Widget>[
            DropdownButton(
              hint: Text('Seleccione Estacion'),
              items: snapshot.data.map((Estacion value) {
                return DropdownMenuItem<Estacion>(
                  value: value,
                  child: Text(value.nombre),
                );
              }).toList(),
              onChanged: (Estacion selecestacion) {
                setState(() {
                  EstacionServices.selectedEstacion = selecestacion;
                });
              },
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(106, 190, 139, 1)
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: EstacionServices.selectedEstacion == null ? Text('Escoja una estacion') : Text(
                EstacionServices.selectedEstacion.nombre,
                style: TextStyle(
                  color: Color.fromRGBO(50, 104, 214, 1),
                  fontSize: 17
                ),
              )
            )
          ],
        );
      }
    );
  }
}

class DropDownNormalWidget extends StatefulWidget {
  DropDownNormalWidget({Key key}) : super(key: key);

  @override
  _DropDownNormalWidgetState createState() => _DropDownNormalWidgetState();
}

class _DropDownNormalWidgetState extends State<DropDownNormalWidget> {

  Estacion _selectedEstacion;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Estacion>>(
      future: EstacionServices.getEstacions(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return snapshot.data == null ? CircularProgressIndicator() : DropdownButton(
          hint: Text('Seleccione Estacion'),
          value: _selectedEstacion,
          items: snapshot.data.map((Estacion value) {
            return DropdownMenuItem<Estacion>(
              value: value,
              child: Text(value.nombre),
            );
          }).toList(),
          onChanged: (Estacion selecestacion) {
            setState(() {
              _selectedEstacion = selecestacion;
            });
          },
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(106, 190, 139, 1)
          ),
        );
      },
    );
  }
}
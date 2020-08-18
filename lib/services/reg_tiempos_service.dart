import 'package:flutter/material.dart';
import 'package:maestros/services/estacion_service.dart';
import 'package:maestros/utils/server.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'auth.dart';
import 'dart:convert';

class RegTiemposService {

  static void validate(BuildContext context, String codigo) async {
    var snackbar = SnackBar(
      duration: Duration(seconds: 3),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      content: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Icon(MaterialCommunityIcons.alert_circle),
          SizedBox(width: 10),
          Text('Debe Seleccionar una estacion Primero')
        ],
      )
    );
    EstacionServices.selectedEstacion == null ? Scaffold.of(context).showSnackBar(snackbar) : postRegTiempo(context, codigo);
  }

  static void postRegTiempo(BuildContext context, String codigoGrupo) async {
    try {
      var uri = Uri.http(Server.URL, "/api/app/regtiempo");
      var response = await Server.client.post(uri, headers: Server.getHeader(Auth.Token), body: json.encode({
        "CodigoGrupo": codigoGrupo,
        "EstacionID": EstacionServices.selectedEstacion.id
      }));
      print(response.body);
      print(response.statusCode);
      final greenSnackbar = SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        content: Row(
          children: <Widget>[
            Icon(MaterialCommunityIcons.check_bold),
            SizedBox(width: 10),
            Text(response.statusCode.toString()),
          ],
        )
      );

      Scaffold.of(context).showSnackBar(greenSnackbar);

    }catch (e) {
      print(e);
    }
  }
  
}
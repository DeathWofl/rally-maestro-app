import 'dart:convert';
import 'package:maestros/models/estacions.dart';
import 'package:maestros/utils/server.dart';
import 'package:maestros/services/auth.dart';

class EstacionServices {

  static Estacion selectedEstacion;

  static Future<List<Estacion>> getEstacions() async {
    try {
      var uri = Uri.http(Server.URL, "/api/app/estacion");
      var response = await Server.client.get(uri, headers: Server.getHeader(Auth.Token));
      print(response.statusCode);
      
      var decode = json.decode(response.body);
      EstacionList estacionList = EstacionList.fromjson(decode);
      List<Estacion> estacions = [];

      for (var item in estacionList.estacions) {
        Estacion estacion = Estacion(id: item.id, nombre: item.nombre, description: item.description);
        estacions.add(estacion);
      }

      // selectedEstacion.nombre.isEmpty ? selectedEstacion = estacions[0] : selectedEstacion = selectedEstacion;
      return estacions;
    } catch (e) {
      print(e);
    }
  }
}
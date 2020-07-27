class Estacion {
  final int id;
  final String nombre;
	final String description;

  Estacion({this.id, this.nombre, this.description});

  factory Estacion.fromJson(Map<String, dynamic> json) {
    return Estacion(
      id: json['ID'],
      nombre: json['nombre'],
      description: json['Descripcion']
    );
  }

}

class EstacionList {
  
  final List<Estacion> estacions;
  EstacionList({this.estacions});

  factory EstacionList.fromjson(List<dynamic> jsonParsed) {
    List<Estacion> estacions = List<Estacion>();
    estacions = jsonParsed.map((e) => Estacion.fromJson(e)).toList();

    return EstacionList(estacions: estacions);
  }
}
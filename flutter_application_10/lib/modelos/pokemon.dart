import 'dart:convert';

class Pokemon{
  final int id;
  final String nombre;
  final String tipo;
  final String ps;
  final String ataque;
  final String defensa;
  final String foto;
  

  Pokemon({
    required this.id,
    required this.nombre,
    required this.tipo,
    required this.ps,
    required this.ataque,
    required this.defensa,
    required this.foto,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'],
      nombre: json['nombre'],
      tipo: json['tipo'],
      ps: json['ps'],
      ataque: json['ataque'],
      defensa: json['defensa'],
      foto: json['foto']
    );
  }
}

List<Pokemon> userFromJson(String str) {
  final jsonData = json.decode(str);
  return List<Pokemon>.from(jsonData.map((item) => Pokemon.fromJson(item)));
}

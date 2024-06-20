import 'dart:convert';

class PokemonElement {
  int id;
  String nombre;
  String tipo;
  String ps;
  String ataque;
  String defensa;
  String foto;

  PokemonElement({
    required this.id,
    required this.nombre,
    required this.tipo,
    required this.ps,
    required this.ataque,
    required this.defensa,
    required this.foto,
  });

  factory PokemonElement.fromJson(Map<String, dynamic> json) {
    return PokemonElement(
      id: json['id'],
      nombre: json['nombre'],
      tipo: json['tipo'],
      ps: json['ps'],
      ataque: json['ataque'],
      defensa: json['defensa'],
      foto: json['foto'],
    );
  }

  List<PokemonElement> parsePokemons(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<PokemonElement>((json) => PokemonElement.fromJson(json)).toList();
 }

}


List<PokemonElement> parsePokemons(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<PokemonElement>((json) => PokemonElement.fromJson(json)).toList();
}





  



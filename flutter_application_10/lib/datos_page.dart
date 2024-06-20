import 'package:flutter/material.dart';
import 'modelos/pokemon.dart';

class DatosPage extends StatelessWidget {
  final List<PokemonElement> pokemons;

  const DatosPage({Key? key, required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Pokémons'),
      ),
      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return ListTile(
            leading: Image.network(pokemon.foto),
            title: Text(pokemon.nombre),
            subtitle: Text('${pokemon.tipo} - PS: ${pokemon.ps}'),
          );
        },
      ),
    );
  }
}


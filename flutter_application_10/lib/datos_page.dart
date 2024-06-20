import 'package:flutter/material.dart';
import 'modelos/pokemon.dart';

class DatosPage extends StatelessWidget {
  final List<PokemonElement> pokemons;

  const DatosPage({Key? key, required this.pokemons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(pokemon.foto),
            ),
            title: Text(pokemon.nombre),
            subtitle: Text('Ataque: ${pokemon.ataque} - Defensa: ${pokemon.defensa}'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(pokemon.nombre),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(pokemon.foto, width: 100, height: 100),
                        SizedBox(height: 8),
                        Text('ID: ${pokemon.id}'),
                        Text('Tipo: ${pokemon.tipo}'),
                        Text('PS: ${pokemon.ps}'),
                        Text('Ataque: ${pokemon.ataque}'),
                        Text('Defensa: ${pokemon.defensa}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Cerrar'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}



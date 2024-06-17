import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'carga_page.dart';
import 'datos_page.dart';
import 'error_page.dart';
import 'modelos/pokemon.dart';


class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 144, 144, 144),
       title: Text(
      'Pokemons',
      style: TextStyle(color: Colors.black),),),
        
      body: FutureBuilder( 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if (snapshot.hasError) {
              return ErrorPage();
            } else if (snapshot.hasData) {
              return DatosPage(pokemons: snapshot.data as List<Pokemon>);
            }
          }
          return CargaPage();
        },
        future: getList(),
      ),
    );
  }
  Future<List<Pokemon>> getList() async {
    final url = Uri.https('https://848f-179-19-198-28.ngrok-free.app ','/pokemons');
    final response = await http.get(url);
    if (response.statusCode == 200){
      final info = jsonDecode(response.body);
      final data = info["data"];
      return pokemonFromJson(jsonEncode(data));
    }else{
      throw 'Error';
    }
  }
}





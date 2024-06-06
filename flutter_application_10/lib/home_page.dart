import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'carga_page.dart';
import 'datos_page.dart';
import 'error_page.dart';
import 'modelos/user.dart';


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
      'Superheroes',
      style: TextStyle(color: Colors.black),),),
        
      body: FutureBuilder( 
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if (snapshot.hasError) {
              return ErrorPage();
            } else if (snapshot.hasData) {
              return DatosPage(users: snapshot.data as List<User>,);
            }
          }
          return CargaPage();
        },
        future: getList(),
      ),
    );
  }
  Future<List<User>> getList() async {
    final url = Uri.https('reqres.in','/api/users');
    final response = await http.get(url);
    if (response.statusCode == 200){
      final info = jsonDecode(response.body);
      final data = info["data"];
      return userFromJson(jsonEncode(data));
    }else{
      throw 'Error';
    }
  }
}





import 'package:flutter/material.dart';

import 'home_page.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: 'Superheroes DC',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
     );
  }
  
}


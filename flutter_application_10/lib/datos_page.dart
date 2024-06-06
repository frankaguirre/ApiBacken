import 'dart:math';
import 'package:flutter/material.dart';
import 'modelos/user.dart';

class DatosPage extends StatelessWidget {
  final List<User> users;

  const DatosPage({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF0D0D0D), // Negro
            Color(0xFF1F1F1F), // Gris oscuro
          ],
        ),
      ),
      child: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final gradientColors = _generateUniqueGradient();
          return GestureDetector(
            onTap: () {
              final Color appBarColor = gradientColors[0];
              _showUserDetails(context, user, appBarColor);
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradientColors,
                ),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'user_avatar_$index',
                    child: Image.network(
                      user.avatar,
                      width: 80.0,
                      height: 80.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '${user.firstName} ${user.lastName}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    user.email,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showUserDetails(BuildContext context, User user, Color appBarColor) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (_) => UserDetailsPage(user: user, appBarColor: appBarColor),
    ));
  }

  List<Color> _generateUniqueGradient() {
    final Color color1 = Color(0xFF232526); // Gris oscuro
    final Color color2 = Color(0xFF414345); // Gris más claro
    return [color1, color2];
  }

}

class UserDetailsPage extends StatelessWidget {
  final User user;
  final Color appBarColor;

  const UserDetailsPage({
    Key? key,
    required this.user,
    required this.appBarColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: Text('Detalles de ${user.firstName} ${user.lastName}'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              appBarColor.withOpacity(0.7),
              appBarColor.withOpacity(0.4),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'user_avatar_${user.id}',
                child: Image.network(
                  user.avatar,
                  width: 120.0,
                  height: 120.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '${user.firstName} ${user.lastName}',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                user.email,
                style: TextStyle(fontSize: 16.0, color: Colors.grey),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

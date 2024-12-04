import 'package:flutter/material.dart';
import 'package:loginn3/services/auth_service.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Fundo branco
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Feliz Natal",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(width: 8),
            Icon(
              Icons.star,
              color: Colors.amber.shade600, // Estrela dourada
              size: 28,
            ),
          ],
        ),
        backgroundColor: Colors.red.shade700,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícone de Árvore de Natal
            Icon(
              Icons.park, // Ícone de árvore de Natal
              color: Colors.green.shade700,
              size: 150,
            ),
            SizedBox(height: 20),
            Text(
              "Bem-vindo ao app! 🎅",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade800,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final user = await AuthService.signInWithGoogle();
                if (user != null) {
                  // Redirecionar para a HomeScreen após login bem-sucedido
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(user: user),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: Colors.red.shade700, // Botão vermelho
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.login, // Ícone para o botão
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Entrar com Google",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Desejamos a você um Feliz Natal! 🎁",
              style: TextStyle(
                fontSize: 16,
                color: Colors.red.shade700,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

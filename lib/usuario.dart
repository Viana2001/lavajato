import 'package:flutter/material.dart';
import 'estoque.dart';
import 'patio_adnim.dart';
import 'gerenciar.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela do Usuário'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GerenciarFuncionariosScreen()),
                );
              },
              child: Text('Funcionário'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatioAdminScreen()), // Alterar para PatioAdminScreen
                );
              },
              child: Text('Pátio'), // Alterar texto do botão
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EstoqueScreen()),
                );
              },
              child: Text('Estoque'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (route) => true);
              },
              child: Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}

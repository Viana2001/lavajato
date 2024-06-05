import 'package:flutter/material.dart';
import 'main.dart';
import 'patio.dart';
import 'estoque.dart'; // Importa a tela EstoqueScreen

class FuncionarioScreen extends StatelessWidget {
  const FuncionarioScreen({Key? key, required String funcionario}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Funcionário'),
        automaticallyImplyLeading: false, // Remover o botão de voltar
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PatioScreen()),
                );
              },
              child: Text('Pátio'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EstoqueScreen()), // Navega para a tela EstoqueScreen
                );
              },
              child: Text('Estoque'), // Botão para navegar até o estoque
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Sair'),
            ),
          ],
        ),
      ),
    );
  }
}

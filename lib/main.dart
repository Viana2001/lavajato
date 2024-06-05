import 'package:flutter/material.dart';
import 'usuario.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login e Cadastro',
      debugShowCheckedModeBanner: false, // Remover a faixa de DEBUG
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey[900],
        hintColor: Colors.blueAccent,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(),
          fillColor: Colors.grey[800],
          filled: true,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.blueAccent,
          ),
        ),
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  // Usuário preexistente para fins de teste
  final String usuarioPreExistente = 'usuario@example.com';
  final String senhaPreExistente = '123456';

  // Função para simular o login (pode ser substituída pela integração com banco de dados)
  bool fazerLogin(String email, String senha) {
    // Verificar se o email e a senha correspondem ao usuário preexistente
    return email == usuarioPreExistente && senha == senhaPreExistente;
  }

  // Função para simular o cadastro (pode ser substituída pela integração com banco de dados)
  void fazerCadastro(String nome, String email, String senha) {
    // Aqui você pode adicionar lógica para armazenar o novo usuário no banco de dados
    print('Novo usuário cadastrado: Nome: $nome, Email: $email, Senha: $senha');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String email = emailController.text;
                String senha = senhaController.text;

                if (fazerLogin(email, senha)) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => UserScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Credenciais inválidas. Tente novamente.'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () {
                // Simplesmente navegue para a tela de cadastro
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: senhaController,
              decoration: InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                String nome = nomeController.text;
                String email = emailController.text;
                String senha = senhaController.text;

                // Simula o cadastro de um novo usuário
                fazerCadastro(nome, email, senha);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Cadastro realizado com sucesso!'),
                  backgroundColor: Colors.green,
                ));
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}

void fazerCadastro(String nome, String email, String senha) {
}

import 'package:flutter/material.dart';
import 'funcionario.dart';

class Database {
  static List<String> funcionarios = [];

  static void adicionarFuncionario(String nome) {
    funcionarios.add(nome);
  }

  static void editarFuncionario(int index, String novoNome) {
    funcionarios[index] = novoNome;
  }

  static void removerFuncionario(int index) {
    funcionarios.removeAt(index);
  }

  static List<String> getFuncionarios() {
    return List.from(funcionarios);
  }
}

class GerenciarFuncionariosScreen extends StatefulWidget {
  @override
  _GerenciarFuncionariosScreenState createState() =>
      _GerenciarFuncionariosScreenState();
}

class _GerenciarFuncionariosScreenState
    extends State<GerenciarFuncionariosScreen> {
  TextEditingController _funcionarioController = TextEditingController();

  void _adicionarFuncionario() {
    String novoFuncionario = _funcionarioController.text;
    if (novoFuncionario.isNotEmpty) {
      setState(() {
        Database.adicionarFuncionario(novoFuncionario);
        _funcionarioController.clear();
      });
    }
  }

  void _editarFuncionario(int index) {
    _funcionarioController.text = Database.funcionarios[index];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Funcionário'),
          content: TextField(
            controller: _funcionarioController,
            decoration: InputDecoration(labelText: 'Nome do Funcionário'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  Database.editarFuncionario(
                      index, _funcionarioController.text);
                });
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _removerFuncionario(int index) {
    setState(() {
      Database.removerFuncionario(index);
    });
  }

  void _verDetalhesFuncionario(String funcionario) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FuncionarioScreen(funcionario: funcionario),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gerenciar Funcionários'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Funcionários:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: Database.funcionarios.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(Database.funcionarios[index]),
                    onTap: () {
                      _verDetalhesFuncionario(Database.funcionarios[index]);
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editarFuncionario(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _removerFuncionario(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _funcionarioController,
              decoration: InputDecoration(labelText: 'Nome do Funcionário'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adicionarFuncionario,
              child: Text('Adicionar Funcionário'),
            ),
          ],
        ),
      ),
    );
  }
}

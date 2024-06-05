import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EstoqueScreen extends StatefulWidget {
  @override
  _EstoqueScreenState createState() => _EstoqueScreenState();
}

class _EstoqueScreenState extends State<EstoqueScreen> {
  TextEditingController _produtoController = TextEditingController();
  TextEditingController _quantidadeController = TextEditingController();

  List<String> _produtos = [];
  List<int> _quantidades = [];

  @override
  void initState() {
    super.initState();
    // Carregar os dados do banco de dados ao inicializar a tela
    _carregarDadosDoBanco();
  }

  void _carregarDadosDoBanco() {
    // Lógica para carregar os dados do banco de dados (simulado aqui)
    // Substitua isso pela lógica real para carregar os dados do seu banco de dados
    setState(() {
      _produtos = ['Produto A', 'Produto B']; // Substitua pelos dados reais do banco
      _quantidades = [10, 20]; // Substitua pelos dados reais do banco
    });
  }

  void _adicionarProduto() {
    // Lógica para adicionar um produto ao banco de dados (simulado aqui)
    // Substitua isso pela lógica real para adicionar um produto ao seu banco de dados
    String produto = _produtoController.text;
    String quantidade = _quantidadeController.text;

    setState(() {
      _produtos.add(produto);
      _quantidades.add(int.tryParse(quantidade) ?? 0);
      _produtoController.clear();
      _quantidadeController.clear();
    });

    // Lógica para adicionar o produto ao banco de dados
    // Substitua isso pela lógica real para adicionar o produto ao seu banco de dados
  }

  void _editarProduto(int index) {
    _produtoController.text = _produtos[index];
    _quantidadeController.text = _quantidades[index].toString();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Produto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _produtoController,
                decoration: InputDecoration(labelText: 'Nome do Produto'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _quantidadeController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(labelText: 'Quantidade'),
              ),
            ],
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
                  _produtos[index] = _produtoController.text;
                  _quantidades[index] =
                      int.tryParse(_quantidadeController.text) ?? 0;
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

  void _removerProduto(int index) {
    setState(() {
      _produtos.removeAt(index);
      _quantidades.removeAt(index);
    });

    // Lógica para remover o produto do banco de dados
    // Substitua isso pela lógica real para remover o produto do seu banco de dados
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estoque'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Produtos:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _produtos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_produtos[index]),
                    subtitle: Text('Quantidade: ${_quantidades[index]}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            _editarProduto(index);
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _removerProduto(index);
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
              controller: _produtoController,
              decoration: InputDecoration(labelText: 'Nome do Produto'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _quantidadeController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              decoration: InputDecoration(labelText: 'Quantidade'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _adicionarProduto,
              child: Text('Adicionar Produto'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}

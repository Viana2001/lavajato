import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PatioScreen extends StatefulWidget {
  const PatioScreen({Key? key}) : super(key: key);

  @override
  _PatioScreenState createState() => _PatioScreenState();
}

class _PatioScreenState extends State<PatioScreen> {
  final List<Map<String, dynamic>> carData = [
    {
      // 'Modelo': 'Toyota Corolla',
      // 'Placa': 'ABC-1234',
      // 'Cliente': 'João Silva',
      // 'Serviço': 'Lavagem completa',
      // 'Valor': 'R\$ 100,00',
      // 'Status': 'Pendente',
    },
    {
      // 'Modelo': 'Honda Civic',
      // 'Placa': 'XYZ-5678',
      // 'Cliente': 'Maria Oliveira',
      // 'Serviço': 'Polimento',
      // 'Valor': 'R\$ 300,00',
      // 'Status': 'Pendente',
    },
  ];

  void _addCar() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String? modelo;
        String? placa;
        String? cliente;
        String? servico;
        String? valor;

        TextEditingController valorController = TextEditingController();

        return AlertDialog(
          title: Text('Adicionar Carro'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Modelo'),
                  onChanged: (value) {
                    modelo = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Placa'),
                  onChanged: (value) {
                    placa = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Cliente'),
                  onChanged: (value) {
                    cliente = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Serviço'),
                  onChanged: (value) {
                    servico = value;
                  },
                ),
                TextField(
                  controller: valorController,
                  decoration: InputDecoration(labelText: 'Valor (R\$)'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                  ],
                  onChanged: (value) {
                    valor = 'R\$ ' + value +',00';
                  },
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Adicionar'),
              onPressed: () {
                if (modelo != null &&
                    placa != null &&
                    cliente != null &&
                    servico != null &&
                    valor != null) {
                  setState(() {
                    carData.add({
                      'Modelo': modelo!,
                      'Placa': placa!,
                      'Cliente': cliente!,
                      'Serviço': servico!,
                      'Valor': valor!,
                      'Status': 'Pendente',
                    });
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administração do Pátio'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 20.0,
                columns: const [
                  DataColumn(label: Text('Modelo', style: TextStyle(fontSize: 12))),
                  DataColumn(label: Text('Placa', style: TextStyle(fontSize: 12))),
                  DataColumn(label: Text('Cliente', style: TextStyle(fontSize: 12))),
                  DataColumn(label: Text('Serviço', style: TextStyle(fontSize: 12))),
                  DataColumn(label: Text('Valor', style: TextStyle(fontSize: 12))),
                  DataColumn(label: Text('Status', style: TextStyle(fontSize: 12))),
                ],
                rows: carData.map((car) {
                  return DataRow(cells: [
                    DataCell(Text(car['Modelo']!, style: TextStyle(fontSize: 12))),
                    DataCell(Text(car['Placa']!, style: TextStyle(fontSize: 12))),
                    DataCell(Text(car['Cliente']!, style: TextStyle(fontSize: 12))),
                    DataCell(Text(car['Serviço']!, style: TextStyle(fontSize: 12))),
                    DataCell(Text(car['Valor']!, style: TextStyle(fontSize: 12))),
                    DataCell(
                      DropdownButton<String>(
                        value: car['Status'],
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        onChanged: (String? newValue) {
                          setState(() {
                            car['Status'] = newValue!;
                          });
                        },
                        items: <String>['Finalizado', 'Em andamento', 'Pendente']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value, style: TextStyle(fontSize: 12, color: Colors.white)),
                          );
                        }).toList(),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _addCar,
            child: Text('Adicionar Carro'),
          ),
        ],
      ),
    );
  }
}

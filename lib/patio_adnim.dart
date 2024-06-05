import 'package:flutter/material.dart';

class PatioAdminScreen extends StatefulWidget {
  const PatioAdminScreen({Key? key}) : super(key: key);

  @override
  _PatioAdminScreenState createState() => _PatioAdminScreenState();
}

class _PatioAdminScreenState extends State<PatioAdminScreen> {
  late List<Map<String, dynamic>> carData;

  @override
  void initState() {
    super.initState();
    // Ao inicializar, puxa os dados do banco
    carData = fetchCarDataFromDatabase();
  }

  List<Map<String, dynamic>> fetchCarDataFromDatabase() {
    // Lógica para recuperar dados do banco aqui
    // Supondo que você tenha uma função que retorna uma lista de mapas com os dados dos carros
    // Substitua este trecho de código com a lógica real para puxar os dados do banco de dados
    return [
      {
        // 'Modelo': 'Toyota Corolla',
        // 'Placa': 'ABC-1234',
        // 'Serviço': 'Lavagem completa',
        // 'Dono': 'João Silva',
        // 'Valor': 'R\$ 100,00',
        // 'Status': 'Pendente',
      },
      {
        // 'Modelo': 'Honda Civic',
        // 'Placa': 'XYZ-5678',
        // 'Serviço': 'polimento',
        // 'Dono': 'Maria Oliveira',
        // 'Valor': 'R\$ 300,00',
        // 'Status': 'Pendente',
      },
      // Adicione mais dados conforme necessário
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Administração do Pátio'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columnSpacing: 20.0,
          columns: const [
            DataColumn(label: Text('Modelo', style: TextStyle(fontSize: 12))),
            DataColumn(label: Text('Placa', style: TextStyle(fontSize: 12))),
            DataColumn(label: Text('Serviço', style: TextStyle(fontSize: 12))),
            DataColumn(label: Text('Dono', style: TextStyle(fontSize: 12))),
            DataColumn(label: Text('Valor', style: TextStyle(fontSize: 12))),
            DataColumn(label: Text('Status', style: TextStyle(fontSize: 12))),
          ],
          rows: carData.map((car) {
            return DataRow(cells: [
              DataCell(Text(car['Modelo']!, style: TextStyle(fontSize: 12))),
              DataCell(Text(car['Placa']!, style: TextStyle(fontSize: 12))),
              DataCell(Text(car['Serviço']!, style: TextStyle(fontSize: 12))),
              DataCell(Text(car['Dono']!, style: TextStyle(fontSize: 12))),
              DataCell(Text(car['Valor']!, style: TextStyle(fontSize: 12))),
              DataCell(Text(car['Status']!, style: TextStyle(fontSize: 12))),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

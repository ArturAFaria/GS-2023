import 'package:flutter/material.dart';
import 'package:medialcare/src/widgets/custom_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int idade = 78; // idade
  String historico = "Pneumonia"; // historico do paciente
  String diagnostico =
      "Possivel edema pulmonar - Consulta marcada com Pneumologista"; // diagnostigo
  String clinicalData = ""; // Dados clínicos

  Future<String?> _showClinicalDataDialog(BuildContext context) {
    final TextEditingController _clinicalDataController =
        TextEditingController();
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Adicionar Dados Clínicos'),
          content: TextField(
            controller: _clinicalDataController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(hintText: "Descreva os sintomas"),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Adicionar'),
              onPressed: () {
                final newData = _clinicalDataController.text;
                if (newData.isNotEmpty) {
                  Navigator.pop(context, newData);
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _updateClinicalData(String newData) {
    setState(() {
      clinicalData = newData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MediAlCare'),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          HealthInfoCard(
            title: 'Idade',
            value: '$idade',
            icon: Icons.heart_broken,
          ),
          HealthInfoCard(
            title: 'Histórico de Diagnósticos',
            value: '$historico',
            icon: Icons.folder,
          ),
          HealthInfoCard(
            title: 'Diagnóstico Preliminar',
            value: '$diagnostico',
            icon: Icons.view_agenda,
          ),
          HealthInfoCard(
            title: 'Dados Clínicos',
            value: clinicalData.isNotEmpty
                ? clinicalData
                : 'Nenhum dado informado',
            icon: Icons.medical_services,
            trailing: IconButton(
              icon: Icon(Icons.add),
              onPressed: () async {
                final newData = await _showClinicalDataDialog(context);
                if (newData != null) {
                  _updateClinicalData(newData);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HealthInfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Widget? trailing;

  const HealthInfoCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value),
        trailing: trailing,
      ),
    );
  }
}

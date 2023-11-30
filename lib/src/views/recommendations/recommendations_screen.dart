import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget {
  // Dados fictícios para exemplo.
  final List<String> recommendations = [
    'Dieta pobre em sal, uma dieta que restringe o consumo de sal (cloreto de sódio) e outras formas de sódio a não mais que 2.000 mg por dia',
    'Caso continue buscar atendimento médico'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recomendações'),
      ),
      body: ListView.builder(
        itemCount: recommendations.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.thumb_up),
            title: Text(recommendations[index]),
          );
        },
      ),
    );
  }
}

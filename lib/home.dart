import 'package:flutter/material.dart';
import 'imc.dart';
import 'resultado.dart';

class TelaInicial extends StatefulWidget {
  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  final alturaCtrl = TextEditingController();
  final pesoCtrl = TextEditingController();

  void _calcular() {
    final altura = double.tryParse(alturaCtrl.text.replaceAll(',', '.'));
    final peso = double.tryParse(pesoCtrl.text.replaceAll(',', '.'));

    if (altura == null || peso == null || altura <= 0 || peso <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Insira valores válidos."))
      );
      return;
    }

    final imc = IMC(altura: altura, peso: peso);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TelaResultado(imc: imc)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IMC - UCL SAUDE")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.health_and_safety, size: 100, color: Colors.teal),
            SizedBox(height: 20),
            TextField(
              controller: alturaCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura (m)'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: pesoCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              child: Text('Calcular IMC'),
            )
          ],
        ),
      ),
    );
  }
}

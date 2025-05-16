import 'package:flutter/material.dart';
import 'imc.dart';

class TelaResultado extends StatelessWidget {
  final IMC imc;
  TelaResultado({required this.imc});

  String getMensagem(FaixaIMC faixa) {
    switch (faixa) {
      case FaixaIMC.Magreza:
        return "Você está abaixo do peso. Considere buscar ajuda profissional.";
      case FaixaIMC.Normal:
        return "Parabéns! Seu peso está ideal.";
      case FaixaIMC.Sobrepeso:
        return "Atenção! Você está com sobrepeso.";
      case FaixaIMC.Obesidade:
        return "Cuidado! Obesidade detectada.";
      case FaixaIMC.ObesidadeGrave:
        return "Risco alto! Obesidade grave.";
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    final cor = imc.faixa.cor;

    return Scaffold(
      appBar: AppBar(title: Text("Resultado do IMC"), backgroundColor: cor),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(24),
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: cor, width: 6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.person, size: 80, color: cor),
              Text(imc.valor.toStringAsFixed(1),
                  style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold)),
              Text(
                "Classificação: ${imc.faixa.texto}",
                style: TextStyle(fontSize: 20, color: cor),
              ),
              SizedBox(height: 20),
              Text(
                getMensagem(imc.faixa),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}

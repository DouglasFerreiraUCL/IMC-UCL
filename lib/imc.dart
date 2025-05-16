import 'package:flutter/material.dart';

enum FaixaIMC {
  Magreza,
  Normal,
  Sobrepeso,
  Obesidade,
  ObesidadeGrave
}

extension FaixaIMCDescricao on FaixaIMC {
  String get texto {
    switch (this) {
      case FaixaIMC.Magreza:
        return 'Magreza';
      case FaixaIMC.Normal:
        return 'Normal';
      case FaixaIMC.Sobrepeso:
        return 'Sobrepeso';
      case FaixaIMC.Obesidade:
        return 'Obesidade';
      case FaixaIMC.ObesidadeGrave:
        return 'Obesidade Grave';
    }
  }

  Color get cor {
    switch (this) {
      case FaixaIMC.Magreza:
        return Colors.blue;
      case FaixaIMC.Normal:
        return Colors.green;
      case FaixaIMC.Sobrepeso:
        return Colors.orange;
      case FaixaIMC.Obesidade:
        return Colors.red;
      case FaixaIMC.ObesidadeGrave:
        return Colors.purple;
    }
  }
}

class IMC {
  final double altura;
  final double peso;

  IMC({required this.altura, required this.peso});


  double get valor => peso / (altura * altura);

  FaixaIMC get faixa {
    final imc = valor;
    if (imc < 18.5) return FaixaIMC.Magreza;
    if (imc < 25.0) return FaixaIMC.Normal;
    if (imc < 30.0) return FaixaIMC.Sobrepeso;
    if (imc < 40.0) return FaixaIMC.Obesidade;
    return FaixaIMC.ObesidadeGrave;
  }
}

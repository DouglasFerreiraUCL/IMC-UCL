import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Calculadora IMC',
    theme: ThemeData(primarySwatch: Colors.teal),
    home: TelaInicial(),
  ));
}

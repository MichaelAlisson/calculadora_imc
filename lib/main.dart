import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  runApp(MyApp());

  group('Calculadora IMC', () {
    test('Cálculo do imc correto', () {
      // Criação de uma nova instância _MyHomePageState
      _MyHomePageState state = _MyHomePageState();

      // Defina as propriedades _peso e _altura
      state._peso = 70;
      state._altura = 175;

      // Chame a função _calcularIMC
      double IMCatual = state._calcularIMC();

      // Calcule o IMC esperado
      double IMCesperado =
          state._peso / (state._altura / 100 * state._altura / 100);

      // Verifique se o IMC calculado é igual ao valor esperado
      expect(IMCatual, closeTo(IMCesperado, 0.01));
    });
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _peso = 0.0;
  double _altura = 0.0;
  double _imc = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Coloque seu peso em kg'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _peso = double.parse(value);
              });
            },
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Coloque seu altura em cm'),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              if (value.isNotEmpty && double.tryParse(value) != null) {
                setState(() {
                  _altura = double.parse(value);
                });
              }
            },
          ),
          ElevatedButton(
              onPressed: () {
                double _calcularIMC() {
                  _imc = _peso / (_altura / 100 * _altura / 100);
                  return _imc;
                }
              },
              child: Text('Calcular IMC')),
          Text('Seu IMC é: $_imc')
        ],
      ),
    );
  }

  double _calcularIMC() {
    _imc = _peso / (_altura / 100 * _altura / 100);
    return _imc;
  }
}

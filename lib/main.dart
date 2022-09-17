import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Mi Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum Operacion { sumar, restar, multiplicar, dividir }

class _MyHomePageState extends State<MyHomePage> {
  final _numero1 = TextEditingController();
  final _numero2 = TextEditingController();

  int _total = 0;

  void _calcular(Enum operacion) {
    setState(() {
      switch (operacion) {
        case Operacion.sumar:
          _total = int.parse(_numero1.text) + int.parse(_numero2.text);
          break;
        case Operacion.restar:
          _total = int.parse(_numero1.text) - int.parse(_numero2.text);
          break;
        case Operacion.multiplicar:
          _total = int.parse(_numero1.text) * int.parse(_numero2.text);
          break;
        case Operacion.dividir:
          _total = int.parse(_numero1.text) ~/ int.parse(_numero2.text);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _numero1,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite el primer numero'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _numero2,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite el segundo numero'),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _calcular(Operacion.sumar);
                    },
                    child: const Text('+')),
                const SizedBox(
                  width: 16.0,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _calcular(Operacion.restar);
                    },
                    child: const Text('-')),
                const SizedBox(
                  width: 16.0,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _calcular(Operacion.multiplicar);
                    },
                    child: const Text('*')),
                const SizedBox(
                  width: 16.0,
                ),
                ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _calcular(Operacion.dividir);
                    },
                    child: const Text('/')),
              ]),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                'El total es: $_total',
                style:
                    const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

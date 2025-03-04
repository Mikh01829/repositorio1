import 'package:flutter/material.dart';
import 'dart:async';

class contador extends StatefulWidget {
  const contador({super.key});

  @override
  State<contador> createState() => _contadorState();
}

class _contadorState extends State<contador> {
  int clickcontador = 0;
  int segundos = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _iniciarCronometro();
  }

  void _iniciarCronometro() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        segundos++;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contador y Cronómetro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cantidad de Clicks'),
            Text(
              '$clickcontador',
              style: TextStyle(fontSize: 150, fontWeight: FontWeight.w100),
            ),
            SizedBox(height: 20),
            Text('Tiempo transcurrido: $segundos segundos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                clickcontador++;
              });
            },
            child: Icon(Icons.plus_one),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                clickcontador--;
              });
            },
            child: Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}

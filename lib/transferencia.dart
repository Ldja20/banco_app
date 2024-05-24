import 'package:flutter/material.dart';

class Transferencia extends StatefulWidget {
  const Transferencia({super.key});

  @override
  State<Transferencia> createState() => _TransferenciaState();
}

class _TransferenciaState extends State<Transferencia> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transferencia'),
          backgroundColor: Colors.amber,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          )),
        ),
        body: const Padding(
          padding:  EdgeInsets.all(10.0),
          child:  Text('tela de Transferencia')
        ));
  }
}

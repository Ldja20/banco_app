import 'package:flutter/material.dart';

// tela principal
class Transferencia extends StatefulWidget {
  const Transferencia({super.key});

  @override
  State<Transferencia> createState() => _TransferenciaUm();
}

class _TransferenciaUm extends State<Transferencia> {
  final valorControl = TextEditingController();
  final String usuario = '';
  double valorConta = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transferencia'),
          backgroundColor: Colors.blue,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          )),
        ),
        body: SafeArea(
          child: Stack(
            alignment: const AlignmentDirectional(0, -1),
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
                  const Text('Usuario'),
                  const Text('Valor em conta'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: TextFormField(
                      controller: valorControl,
                      onChanged: (value) {
                        setState(() {
                          valorConta = double.parse(value);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Valor a transferir',
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TransferenciaDois(),
                        ));
                      },
                      child: const Text('comfirmar'))
                ],
              )
            ],
          ),
        ));
  }
}

// tela de para quem transferir
//
class TransferenciaDois extends StatefulWidget {
  const TransferenciaDois({super.key});

  @override
  State<TransferenciaDois> createState() => _TransferenciaDois();
}

class _TransferenciaDois extends State<TransferenciaDois> {
  final valorControl = TextEditingController();
  final String usuario = '';
  double valorConta = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Transferencia'),
          backgroundColor: Colors.blue,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          )),
        ),
        body: SafeArea(
          child: Stack(
            alignment: const AlignmentDirectional(0, -1),
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
                  const Text('Usuario'),
                  const Text('Valor em conta'),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: TextFormField(
                      controller: valorControl,
                      onChanged: (value) {
                        setState(() {
                          valorConta = double.parse(value);
                        });
                      },
                      decoration: InputDecoration(
                        labelText: 'Transferir para',
                        enabledBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {}, child: const Text('comfirmar'))
                ],
              )
            ],
          ),
        ));
  }
}

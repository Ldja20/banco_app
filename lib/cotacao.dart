import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// metodo que acessa a api
Future<Map> getData() async {
  var url =
      Uri.parse('https://api.hgbrasil.com/finance?format=json&key=d13e46e9');

  http.Response response = await http.get(url);
  // print('STATUS DA RESPOSTA: ${response.statusCode}');
  // print('RESPOSTA: ${response.body}');
  return json.decode(response.body);
}

// classe principal do app
class Cotacao extends StatefulWidget {
  const Cotacao({super.key});

  @override
  State<Cotacao> createState() => _CotacaoState();
}

class _CotacaoState extends State<Cotacao> {
  final realControl = TextEditingController();
  final dolarControl = TextEditingController();
  final euroControl = TextEditingController();
  final btcControl = TextEditingController();
  double euro = 0.0;
  double dolar = 0.0;
  double btc = 0.0;

// funções que mudam o valor dos campos não preenchidos
//mudar o valor de euro e dolar
  VoidCallback? _realChanged(String text) {
    double real = double.parse(text);
    dolarControl.text = (real / dolar).toStringAsFixed(2);
    euroControl.text = (real / euro).toStringAsFixed(2);
    btcControl.text = (real / btc).toStringAsFixed(4);
    return null;
  }

  //muda o valor de real e euro
  VoidCallback? _dolarChanged(String text) {
    double dolar = double.parse(text);
    realControl.text = (dolar * this.dolar).toStringAsFixed(2);
    euroControl.text = (dolar * this.dolar / euro).toStringAsFixed(2);
    btcControl.text = (dolar * this.dolar / btc).toStringAsFixed(4);
    return null;
  }

  VoidCallback? _euroChanged(String text) {
    double euro = double.parse(text);
    realControl.text = (euro * this.euro).toStringAsFixed(2);
    dolarControl.text = (euro * this.euro / dolar).toStringAsFixed(2);
    btcControl.text = (euro * this.euro / btc).toStringAsFixed(4);
    return null;
  }

  VoidCallback? _btcChanged(String text) {
    double btc = double.parse(text);
    realControl.text = (btc * this.btc).toStringAsFixed(2);
    dolarControl.text = (btc * this.btc / dolar).toStringAsFixed(2);
    euroControl.text = (btc * this.btc / euro).toStringAsFixed(2);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cotação Atual'),
          backgroundColor: Colors.blue,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          )),
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(child: Text('Aguarddando servidor...'));
                default:
                  if (snapshot.hasError) {
                    String? erro = snapshot.error.toString();
                    return Center(
                      child: Text('houve uma falha ao buscar os dados: $erro'),
                    );
                  } else {
                    dolar =
                        snapshot.data!['results']['currencies']['USD']['buy'];
                    euro =
                        snapshot.data!['results']['currencies']['EUR']['buy'];
                    btc = snapshot.data!['results']['currencies']['BTC']['buy'];
                    return SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          textField('REAL', 'R\$ ', realControl, _realChanged),
                          textField(
                              'DOLAR', 'US\$ ', dolarControl, _dolarChanged),
                          textField('EURO', '€', euroControl, _euroChanged),
                          textField('BITCOIN', '₿', btcControl, _btcChanged),
                          ElevatedButton(
                              onPressed: () {
                                realControl.value = const TextEditingValue();
                                dolarControl.value = const TextEditingValue();
                                euroControl.value = const TextEditingValue();
                                btcControl.value = const TextEditingValue();
                              },
                              child: const Text('limpar'))
                        ],
                      ),
                    );
                  }
              }
            }));
  }

// widget personalizado
  Widget textField(String label, String prefix, TextEditingController control,
      Function? func) {
    return TextField(
      controller: control,
      decoration: InputDecoration(
        labelText: label,
        prefixText: prefix,
      ),
      onChanged: (value) => {func!(value)},
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}

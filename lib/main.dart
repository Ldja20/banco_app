import 'package:flutter/material.dart';
import 'login.dart';
import 'cotacao.dart';
import 'transferencia.dart';

void main() async {
  runApp(const MeuPrimeiroAplicativo());
}

class MeuPrimeiroAplicativo extends StatelessWidget {
  // Classe Estática

  const MeuPrimeiroAplicativo(
      {super.key}); //método construtor (Cria o Objeto e usa extende os métodos da super classe)

  @override //Sobrescrita
  Widget build(BuildContext context) {
    return MaterialApp(
        // Widget material design
        title: 'Aplicativo de Cálculo',
        debugShowCheckedModeBanner: false, // Remove o icone de debug
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/cotacao',
        routes: {
          '/transferencia': (context) => const Transferencia(),
          '/cotacao': (context) => const Cotacao(),
          '/principal': (context) => const Home(),
          '/login': (context) => const Login()
        } // rotas nomeadas

        );
  }
}

class Home extends StatefulWidget {
  //Classe dinâmica
  const Home(
      {super.key}); // método construtor (Cria o Objeto e usa extende os métodos da super classe)

  @override
  State<StatefulWidget> createState() {
    return _CalcContaEstado(); //Chama a classe de cálculo
  }
}

class Tela extends StatelessWidget {
  final String text;
  final String route;
  final icon;
  const Tela(
    this.text,
    this.route,
    this.icon, {
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            fixedSize: const Size(170, 100),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(route);
          },
          label: Text(text,
              style: const TextStyle(fontSize: 15, color: Colors.white)),
          icon: icon,
          //analytics_outlined, align_vertical_bottom, attach_money
          //bar_chart_rounded, currency_exchange_rounded
          //import_export_rounded
        ),
      ),
    );
  }
}

class _CalcContaEstado extends State<Home> {
  // método “build” sobrescrito
  // (é dentro do build que vamos criar
  // os Widgets que o usuário vai interagir)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Conta'),
          backgroundColor: Colors.amber,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          )),
        ),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                Tela(
                    'Cotação',
                    '/cotacao',
                    Icon(
                      Icons.currency_exchange_rounded,
                      color: Colors.white,
                    )),
                Tela(
                    'Transferencia',
                    '/transferencia',
                    Icon(
                      Icons.import_export_rounded,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ));
  }
}

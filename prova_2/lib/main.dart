import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: 'HB Finanças',
    initialRoute: '/',
    routes: {
      '/': (context) => TelaFinanceira(tipo: TipoTela.PrincipaisMoedas),
      '/acoes': (context) => TelaFinanceira(tipo: TipoTela.Acoes),
      '/bitcoin': (context) => TelaFinanceira(tipo: TipoTela.Bitcoin),
    },
  ));
}

enum TipoTela { PrincipaisMoedas, Acoes, Bitcoin }

class TelaFinanceira extends StatefulWidget {
  final TipoTela tipo;

  TelaFinanceira({required this.tipo});

  @override
  _TelaFinanceiraState createState() => _TelaFinanceiraState();
}

class _TelaFinanceiraState extends State<TelaFinanceira> {
  final String apiKey = '4654367d';
  Map<String, dynamic> financeData = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    String url;
    switch (widget.tipo) {
      case TipoTela.PrincipaisMoedas:
        url = 'https://api.hgbrasil.com/finance?key=$apiKey&format=json-cors';
        break;
      case TipoTela.Acoes:
        url =
            'https://api.hgbrasil.com/finance/stocks?key=$apiKey&format=json-cors';
        break;
      case TipoTela.Bitcoin:
        url =
            'https://api.hgbrasil.com/finance/bitcoin?key=$apiKey&format=json-cors';
        break;
    }

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          financeData = data['results'];
        });
      } else {
        throw Exception('Falha ao carregar dados financeiros');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getTituloTela()),
      ),
      body: financeData.isNotEmpty
          ? ListView.builder(
              itemCount: financeData.length,
              itemBuilder: (context, index) {
                final key = financeData.keys.toList()[index];
                final value = financeData[key]['buy'];
                final variation = financeData[key]['variation'];
                final color = variation > 0 ? Colors.blue : Colors.red;

                return ListTile(
                  title: Text(
                    key,
                    style: TextStyle(color: color),
                  ),
                  subtitle: Text(
                    'Valor: $value\nVariação: $variation',
                    style: TextStyle(color: color),
                  ),
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  String _getTituloTela() {
    switch (widget.tipo) {
      case TipoTela.PrincipaisMoedas:
        return 'Principais Moedas';
      case TipoTela.Acoes:
        return 'Ações';
      case TipoTela.Bitcoin:
        return 'Bitcoin';
    }
  }
}

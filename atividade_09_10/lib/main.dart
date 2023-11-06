import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Item {
  String nome;
  int quantidade;
  double valorUnitario;

  Item(this.nome, this.quantidade, this.valorUnitario);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _quantidadeController = TextEditingController();
  final TextEditingController _valorUnitarioController =
      TextEditingController();
  List<Item> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Itens de Compra'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome do item'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _quantidadeController,
                decoration: InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _valorUnitarioController,
                decoration: InputDecoration(labelText: 'Valor Unitário'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    final nome = _nomeController.text;
                    final quantidade = int.parse(_quantidadeController.text);
                    final valorUnitario =
                        double.parse(_valorUnitarioController.text);
                    final item = Item(nome, quantidade, valorUnitario);
                    setState(() {
                      items.add(item);
                    });
                    _nomeController.clear();
                    _quantidadeController.clear();
                    _valorUnitarioController.clear();
                  }
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListPage(items: items),
            ),
          );
        },
        child: Icon(Icons.list),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  final List<Item> items;

  ListPage({required this.items});

  @override
  Widget build(BuildContext context) {
    double totalPedido = 0.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Itens de Compra'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          final valorTotal = item.quantidade * item.valorUnitario;
          totalPedido += valorTotal;

          return ListTile(
            title: Text(item.nome),
            subtitle: Text(
                'Quantidade: ${item.quantidade}, Valor Unitário: R\$ ${item.valorUnitario.toStringAsFixed(2)}'),
            trailing: Text('Total: R\$ ${valorTotal.toStringAsFixed(2)}'),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Excluir Item'),
                    content: Text('Deseja realmente excluir este item?'),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar'),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                          items.removeAt(index);
                          Scaffold.of(context).showSnackBar(SnackBar(
                            content: Text('Item excluído com sucesso.'),
                          ));
                        },
                        child: Text('Confirmar'),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Total do Pedido'),
                content: Text(
                    'O valor total do pedido é R\$ ${totalPedido.toStringAsFixed(2)}'),
                actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Fechar'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

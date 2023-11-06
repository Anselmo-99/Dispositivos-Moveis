import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Transaction {
  final String type;
  final double amount;

  Transaction(this.type, this.amount);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String inputValue = "0";
  String transactionType = "";
  List<Transaction> transactions = [];

  void updateValue(String newValue) {
    setState(() {
      inputValue = newValue;
    });
  }

  void setTransactionType(String type) {
    setState(() {
      transactionType = type;
    });
  }

  void addTransaction() {
    double amount = double.tryParse(inputValue) ?? 0;
    if (amount > 0) {
      transactions.add(Transaction(transactionType, amount));

      updateValue("0");
    }
  }

  double calculateTotal() {
    double total = 0;
    for (var transaction in transactions) {
      if (transaction.type == "Crédito") {
        total += transaction.amount;
      } else if (transaction.type == "Débito") {
        total -= transaction.amount;
      }
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    Color totalTextColor = calculateTotal() < 0 ? Colors.red : Colors.black;

    return Scaffold(
      appBar: AppBar(
        title: Text("Avaliação"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Valor: $inputValue",
            style: TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setTransactionType("Crédito");
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 8),
                    Text("Crédito"),
                  ],
                ),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: () {
                  setTransactionType("Débito");
                },
                child: Row(
                  children: [
                    Icon(Icons.remove),
                    SizedBox(width: 8),
                    Text("Débito"),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(16),
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (newValue) {
                    updateValue(newValue);
                  },
                  decoration: InputDecoration(
                    labelText: "Insira o valor",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: addTransaction,
            child: Text("Adicionar Transação"),
          ),
          Text(
            "Total: ${calculateTotal().toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 24,
              color: totalTextColor,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  title: Text(
                    "${transaction.type}: ${transaction.amount.toStringAsFixed(2)}",
                    style: TextStyle(
                      color: transaction.type == "Crédito"
                          ? Colors.blue
                          : Colors.red,
                    ),
                  ),
                  trailing: Icon(
                    transaction.type == "Crédito" ? Icons.add : Icons.remove,
                    color: transaction.type == "Crédito"
                        ? Colors.blue
                        : Colors.red,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

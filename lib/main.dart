import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

main() => runApp(
      DevicePreview(
        builder: (_) {
          return const ExpensesApp();
        },
      ),
    );

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              SizedBox(
                child: Card(
                  color: Colors.blueGrey,
                  elevation: 5,
                  child: Text('Gráfico'),
                ),
              ),
              TransactionUser()
            ]),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

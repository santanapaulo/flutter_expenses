import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:flutter/material.dart';

import '../models/transaction.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {
  final _transactions = [
    Transaction(
        id: 'id1', title: 'Novo tênis', value: 250, date: DateTime.now()),
    Transaction(
        id: 'id2', title: 'Almoço #1', value: 100, date: DateTime.now()),
    // Transaction(
    //     id: 'id3', title: 'Almoço #2', value: 100, date: DateTime.now()),
    // Transaction(
    //     id: 'id4', title: 'Almoço #3', value: 100, date: DateTime.now()),
    // Transaction(
    //     id: 'id5', title: 'Almoço #4', value: 100, date: DateTime.now()),
    // Transaction(
    //     id: 'id6', title: 'Almoço #5', value: 100, date: DateTime.now()),
    // Transaction(
    //     id: 'id7', title: 'Almoço #6', value: 100, date: DateTime.now()),
    // Transaction(
    //     id: 'id8', title: 'Almoço #7', value: 100, date: DateTime.now()),
    // Transaction(
    //     id: 'id9', title: 'Almoço #8', value: 100, date: DateTime.now()),
    // Transaction(
    //     id: 'id10', title: 'Almoço #9', value: 100, date: DateTime.now()),
    // Transaction(
    //     id: 'id11', title: 'Almoço #10', value: 100, date: DateTime.now()),
  ];

  _addTransaction(String title, double value) {
    final transaction = Transaction(
        id: Random().nextDouble().toString(),
        title: title,
        value: value,
        date: DateTime.now());

    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionForm(
          onSubmit: _addTransaction,
        ),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}

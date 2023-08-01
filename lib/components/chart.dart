import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentsTransactions;

  const Chart({super.key, required this.recentsTransactions});

  List<Map<String, dynamic>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double totalSum = 0.0;

      for (var transaction in recentsTransactions) {
        bool sameDay = transaction.date.day == weekDay.day;
        bool sameMonth = transaction.date.month == weekDay.month;
        bool sameYear = transaction.date.year == weekDay.year;

        if (sameDay && sameMonth && sameYear) {
          totalSum += transaction.value;
        }
      }

      return {'day': DateFormat.E().format(weekDay)[0], 'value': totalSum};
    });
  }

  double get _weekTotalValue {
    return groupedTransactions.fold(
        0.0, (sum, transaction) => sum + transaction['value']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactions
              .map((transaction) => ChartBar(
                  value: transaction['value'],
                  label: transaction['day'].toString(),
                  percentage: transaction['value'] / _weekTotalValue))
              .toList(),
        ),
      ),
    );
  }
}

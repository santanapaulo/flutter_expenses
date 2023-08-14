import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double value;
  final String label;
  final double percentage;

  const ChartBar(
      {super.key,
      required this.value,
      required this.label,
      required this.percentage});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Column(
        children: [
          SizedBox(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(child: Text(value.toStringAsFixed(2)))),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(
            height: constraints.maxHeight * 0.6,
            width: 10,
            child:
                Stack(alignment: AlignmentDirectional.bottomCenter, children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5)),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(5))),
              )
            ]),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.05,
          ),
          SizedBox(height: constraints.maxHeight * 0.15, child: Text(label))
        ],
      );
    });
  }
}

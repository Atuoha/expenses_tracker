// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double pctAmount;

  // ignore: use_key_in_widget_constructors
  ChartBar(
    this.label,
    this.amount,
    this.pctAmount,
  );
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).orientation == Orientation.landscape
            ? 12
            : 20,
        child: Text('\$${amount.toStringAsFixed(0)}',
            style: const TextStyle(fontSize: 13)),
      ),
      const SizedBox(height: 4),
      // ignore: sized_box_for_whitespace
      Container(
        height: MediaQuery.of(context).orientation == Orientation.landscape
            ? 30
            : 70,
        width: 10,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey,
                ),
                color: const Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: pctAmount,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
      const SizedBox(height: 4),
      Text(label)
    ]);
  }
}

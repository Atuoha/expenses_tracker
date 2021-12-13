import 'package:expense_app/screens/expenses_chart.dart';
import 'package:expense_app/screens/expenses_list.dart';
import 'package:flutter/material.dart';

import 'expenses_count.dart';

class CustomBody extends StatelessWidget {
  final bool switchChart;
  final void Function(bool) handleswitchChart;
   // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
   CustomBody({required this.switchChart, required this.handleswitchChart});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        const Text('Show Chart Analysis'),
        Switch.adaptive(
            value: switchChart,
            activeColor: Colors.teal,
            inactiveThumbColor: Colors.teal,
            onChanged: (value) {
              handleswitchChart(value);
            })
      ]),
      switchChart ? ExpensesChart() : const Text(''),
      const ExpensesCount(),
      const ExpensesList(),
    ]);
  }
}

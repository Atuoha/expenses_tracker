// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:expense_app/components/chart_bar.dart';
import 'package:expense_app/model/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> recentTransactions =
        Provider.of<TransactionData>(context).getTransactions;

    double totalAmount = Provider.of<TransactionData>(context).totalSpending;

    return Consumer<TransactionData>(builder: (context, transData, child) {
      return transData.getCount() < 1
          ? const Text('')
          : Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  margin: const EdgeInsets.all(5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: recentTransactions.map((info) {
                          return Flexible(
                            fit: FlexFit.tight,
                            child: ChartBar(
                              '${info['day']}',
                              (info['amount'] as double),
                              totalAmount == 0.0
                                  ? 0.0
                                  : (info['amount'] as double) / totalAmount,
                            ),
                          );
                        }).toList()),
                  ),
                  elevation: 6,
                ),
              ),
            );
    });
  }
}

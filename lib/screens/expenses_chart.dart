import 'package:expense_app/model/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesChart extends StatelessWidget {
  const ExpensesChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionData>(builder: (context, transData, child) {
      return transData.getCount() < 1
          ? const Text('')
          : const Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: Card(
                  child: Center(
                    child: Text(
                      'Upper View UI',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  elevation: 3,
                ),
              ),
            );
    });
  }
}

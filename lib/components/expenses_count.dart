import 'package:expense_app/model/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpensesCount extends StatelessWidget {
  const ExpensesCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 5,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 3,
            color: Colors.teal,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Summary:',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.teal[500],
            ),
          ),
          Text(
            'Total Expenses: ${Provider.of<TransactionData>(context).getCount()}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.teal,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Total Spent: \$${Provider.of<TransactionData>(context).totalAmount.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.teal,
              fontWeight: FontWeight.w600,
            ),
          )
        ]),
      ),
    );
  }
}

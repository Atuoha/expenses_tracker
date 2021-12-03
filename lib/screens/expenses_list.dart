import 'package:expense_app/model/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionData>(builder: (context, transdata, child) {
      return transdata.getCount() < 1
          ? const Center(
              child: Text(
                'No Expenses! Why not add one 📝',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 15,
                ),
              ),
            )
          : Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: transdata.getCount(),
                itemBuilder: (context, index) {
                  final trans = transdata.transactions[index];
                  return Card(
                    child: ListTile(
                      leading: Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                          ),
                          color: Colors.teal,
                        ),
                        child: Text(
                          '\$${trans.amount}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          transdata.deleteExpense(trans);
                        },
                        icon: const Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ),
                      title: Text(
                        trans.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMMEEEEd().format(trans.date),
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
    });
  }
}

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
                'No Expenses! Why not make one 😍😎',
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                ),
              ),
            )
          : Expanded(
              flex: 3,
              child: ListView.builder(
                itemCount: transdata.getCount(),
                itemBuilder: (context, index) {
                  final trans = transdata.transactions[index];
                  return Column(children: [
                    Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 15,
                            ),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.teal,
                                width: 3,
                              ),
                            ),
                            child: Text(
                              '\$${trans.amount}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                          ),
                          Column(
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  trans.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  DateFormat.yMMMMEEEEd().format(trans.date),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ]),
                          IconButton(
                            onPressed: () {
                              transdata.deleteExpense(trans);
                            },
                            icon: const Icon(
                              Icons.delete_forever,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    )
                  ]);
                },
              ),
            );
    });
  }
}

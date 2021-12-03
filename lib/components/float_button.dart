import 'package:expense_app/screens/add_expense.dart';
import 'package:flutter/material.dart';

class FloatButton extends StatelessWidget {
  const FloatButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () => {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    color: const Color(0xff757575),
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddExpense(
                        // handler: (item, amount, date) => {
                        //       Provider.of<TransactionData>(context).addExpense(
                        //         item,
                        //         amount,
                        //         date,
                        //       )
                        //     }

                        ),
                  ),
                ),
              )
            },
        child: const Icon(
          Icons.add,
        ));
  }
}

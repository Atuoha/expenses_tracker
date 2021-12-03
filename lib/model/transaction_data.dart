import 'package:expense_app/model/transaction.dart';
import 'package:flutter/cupertino.dart';

class TransactionData extends ChangeNotifier {
  final List<Transaction> transactions = [];

  double totalAmount = 0;
  addExpense(item, amount, date) {
    var transaction = Transaction(title: item, amount: amount, date: date);
    transactions.add(transaction);
    totalAmount += transaction.amount;
    notifyListeners();
  }

  int getCount() {
    return transactions.length;
  }

  

  deleteExpense(Transaction trans) {
    totalAmount -= trans.amount;
    transactions.remove(trans);
    notifyListeners();
  }
}

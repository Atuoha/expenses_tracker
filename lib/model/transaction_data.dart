import 'package:expense_app/model/transaction.dart';
import 'package:flutter/cupertino.dart';

class TransactionData extends ChangeNotifier {
  final List<Transaction> transactions = [];

  addExpense(item, amount, date) {
    var transaction = Transaction(title: item, amount: amount, date: date);
    transactions.add(transaction);
    notifyListeners();
  }

  int getCount() {
    return transactions.length;
  }

  deleteExpense(Transaction trans) {
    transactions.remove(trans);
    notifyListeners();
  }
}

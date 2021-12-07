import 'package:expense_app/model/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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

  List<Transaction> get _recentTransactions {
    return transactions.where((tx) {
      return tx.date.isAfter(DateTime.now().toUtc().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  List<Map<String, Object>> get transactionInfoValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < _recentTransactions.length; i++) {
        if (_recentTransactions[i].date.day == weekday.day &&
            _recentTransactions[i].date.month == weekday.month &&
            _recentTransactions[i].date.year == weekday.year) {
          totalSum += _recentTransactions[i].amount;
        } 
      }
      return {
        'day': DateFormat.E().format(weekday),
        'amount': totalSum,
      };
    });
  }

  get getTransactions => transactionInfoValues;

  deleteExpense(Transaction trans) {
    totalAmount -= trans.amount;
    transactions.remove(trans);
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'components/expenses_count.dart';
import 'components/float_button.dart';
import 'model/transaction_data.dart';
import 'screens/expenses_chart.dart';
import 'screens/expenses_list.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en_US');

    return ChangeNotifierProvider(
      create: (context) => TransactionData(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: 'Quicksand-bold',
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const FloatButton(),
          appBar: AppBar(
            title: const Text(
              'Expense Tracker',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: const Icon(Icons.shopping_bag),
          ),
          body: Column(children: <Widget>[
            ExpensesChart(),
            const ExpensesCount(),
            const ExpensesList(),
          ]),
        ),
      ),
    );
  }
}

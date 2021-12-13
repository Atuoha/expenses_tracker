import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'components/custom_body.dart';
import 'components/float_button.dart';
import 'model/transaction_data.dart';

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool switchChart = true;

  void handleswitchChart(value) {
    setState(() {
      switchChart = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en_US');

    final pageBody = CustomBody(
      switchChart: switchChart,
      handleswitchChart: handleswitchChart,
    );

    return ChangeNotifierProvider(
      create: (context) => TransactionData(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: 'Quicksand-bold',
        ),
        debugShowCheckedModeBanner: false,
        home: Platform.isIOS
            ? CupertinoPageScaffold(
                child: pageBody,
              )
            : Scaffold(
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
                body: pageBody),
      ),
    );
  }
}

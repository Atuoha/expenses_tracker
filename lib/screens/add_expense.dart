// ignore_for_file: must_be_immutable

import 'package:expense_app/model/transaction_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_datepicker/datepicker.dart';

String item = '';
String amount = '';
bool issetDate = false;
DateTime date = DateTime.now();

// ignore: use_key_in_widget_constructors
class AddExpense extends StatelessWidget {
  // final Function(String, String, DateTime) handler;

  // AddExpense({required this.handler});

  showModal(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate != null) {
        date = pickedDate;
        issetDate = true;
      }
    });

    // ---------------------- External DatePicker (syncfusion_flutter_datepicker)
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return Dialog(
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(20),
    //         ),
    //         child: Container(
    //           height: 300,
    //           padding: const EdgeInsets.all(10),
    //           child: SfDateRangePicker(
    //             onSelectionChanged: _onSelectionChanged,
    //             showActionButtons: true,
    //             headerStyle: const DateRangePickerHeaderStyle(
    //               textAlign: TextAlign.center,
    //               textStyle: TextStyle(
    //                 fontSize: 25,
    //                 color: Colors.teal,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             cancelText: 'Dismiss',
    //             confirmText: 'Confirm',
    //             onCancel: () => {Navigator.pop(context)},
    //             onSubmit: (value) {
    //               Navigator.pop(context);
    //             },
    //           ),
    //         ),
    //       );
    //     });
    // --------------------------------------------------
  }

  // ------------------------ private method used for the external datePicker used before
  // void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   date = args.value;
  //   dateString = args.value.toString();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Add Expense',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      Icon(
                        Icons.shopping_bag,
                        size: 30,
                        color: Colors.teal,
                      ),
                    ]),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) => {item = value},
                  decoration: const InputDecoration(
                    labelText: 'Purchased item',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  onChanged: (value) => {amount = value},
                  decoration: const InputDecoration(
                    labelText: '\$ Amount',
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        issetDate
                            ? 'Selected Date: ${DateFormat.yMMMMEEEEd().format(date)}'
                            : 'Select Date',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => {showModal(context)},
                      icon: const Icon(
                        Icons.calendar_today_outlined,
                        color: Colors.teal,
                        size: 25,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => {
                    if (item != '' && amount != '')
                      {
                        Provider.of<TransactionData>(context, listen: false)
                            .addExpense(item, double.parse(amount), date),
                        Navigator.pop(context),
                        item = '',
                        amount = ''
                      }
                  },
                  child: const Text(
                    'Submit',
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

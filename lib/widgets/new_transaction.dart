import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTransaction, {Key? key}) : super(key: key);

  final Function(String title, double amount) addTransaction;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _textController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _SubmitData() {
    final enteredTitle = _textController.text;
    final enteredAmmount = double.parse(_amountController.text);
    if (enteredAmmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addTransaction(
        _textController.text, double.tryParse(_amountController.text)!);
    Navigator.pop(context);
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => _SubmitData(),
            ),
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _SubmitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(_selectedDate == null
                        ? 'No Date Chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate!)}'),
                  ),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: const Text(
                      'Choose Date',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.purple),
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              onPressed: _SubmitData,
              child: const Text('Add Transaction',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold)),
              color: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}

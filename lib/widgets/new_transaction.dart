import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  NewTransaction(this.addTransaction, {Key? key}) : super(key: key);

  final Function(String title, double? ammount) addTransaction;

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final textController = TextEditingController();

  final ammountController = TextEditingController();

  void SubmitData() {
    final enteredTitle = textController.text;
    final enteredAmmount = double.parse(ammountController.text);
    if (enteredAmmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addTransaction(
        textController.text, double.tryParse(ammountController.text));
    Navigator.pop(context);
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
              controller: textController,
              decoration: const InputDecoration(labelText: 'Title'),
              onSubmitted: (_) => SubmitData(),
            ),
            TextField(
              controller: ammountController,
              decoration: const InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => SubmitData(),
            ),
            MaterialButton(
              onPressed: SubmitData,
              child: const Text('Add Transaction'),
              color: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}

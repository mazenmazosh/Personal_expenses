import 'package:flutter/material.dart';
import 'package:personal_expenses_app/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  const TransactionList(this.transactions, {Key? key}) : super(key: key);
  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 320,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        border: Border.all(color: Colors.purple, width: 2.5)),
                    margin: const EdgeInsets.all(20),
                    child: Text(
                      '\$ ${transactions[index].ammount!.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.purple, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        DateFormat('dd-MM-yyyy')
                            .format(transactions[index].date),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey),
                      )
                    ],
                  )
                ],
              ));
            },
            itemCount: transactions.length,
          )),
    );
  }
}
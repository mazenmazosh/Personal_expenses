import 'package:flutter/material.dart';
import 'package:personal_expenses_app/widgets/new_transaction.dart';
import 'models/transaction.dart';
import 'widgets/transaction_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [
    Transaction(
        title: 'new shoes', ammount: 68.8, date: DateTime.now(), id: 't1'),
    Transaction(title: 'new books', ammount: 50, date: DateTime.now(), id: 't2')
  ];
  void _addNewTRansaction(String title, double? ammount) {
    final newtx = Transaction(
        title: title,
        ammount: ammount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransaction.add(newtx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: NewTransaction(_addNewTRansaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              padding: const EdgeInsets.only(right: 5),
              onPressed: () {
                _startAddNewTransaction(context);
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text('Flutter app'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          height: 30,
          child: Card(
            child: Text('Chart'),
          ),
        ),
        TransactionList(_userTransaction),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () => _startAddNewTransaction(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}

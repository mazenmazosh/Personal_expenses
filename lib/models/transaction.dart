class Transaction {
  final String id;
  final String title;
  final double? ammount;
  final DateTime date;

  Transaction(
      {required this.title,
      required this.ammount,
      required this.date,
      required this.id});
}

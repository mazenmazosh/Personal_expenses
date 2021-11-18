import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar(this.label, this.SpendingAmount, this.SpendingPctOfTotal,
      {Key? key})
      : super(key: key);

  final String label;
  final double SpendingAmount;
  final double SpendingPctOfTotal;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      FittedBox(child: Text('\$ ${SpendingAmount.toStringAsFixed(0)}')),
      const SizedBox(
        height: 4,
      ),
      Container(
        height: 60,
        width: 10,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                color: const Color.fromRGBO(220, 220, 220, 1),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            FractionallySizedBox(
              heightFactor: SpendingPctOfTotal,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 4,
      ),
      Text(label),
    ]);
  }
}

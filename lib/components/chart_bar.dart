import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double value;
  final double percentage;

  ChartBar({this.label = '', this.percentage = 0.0, this.value = 0.0});

  String formatValue(double value) {
    if (value >= 1000) {
      return 'R\$${(value / 1000).toStringAsFixed(1)}K';
    } else {
      return 'R\$${value.toStringAsFixed(2)}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    formatValue(value),
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1.0,
                      ),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: percentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text(label),
              ),
            ),
          ],
        );
      },
    );
  }
}

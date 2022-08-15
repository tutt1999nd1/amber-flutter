import 'package:flutter/material.dart';

class WidgetCoin extends StatelessWidget {
  const WidgetCoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Row(
            children: [
              Text("BTC"),
              Text("Bitcoin"),
            ],
          ),
          Text("20.000 \$"),
          Text("-2.5% \$"),
        ],
      ),
    );
  }
}

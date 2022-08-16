import 'package:flutter/material.dart';

class WidgetCoin2 extends StatelessWidget {
  const WidgetCoin2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("BTC/USDT",
                    style:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 16,color: Color(0xff707A8A))),
                Text("-25%",
                    style: TextStyle(color: Color(0xfff6455f),fontWeight: FontWeight.w500, fontSize: 16))
              ],
            ),
            Row(
              children: [
                Text("23.000",
                    style: TextStyle(color: Color(0xfff6455f),fontWeight: FontWeight.w500, fontSize: 18))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

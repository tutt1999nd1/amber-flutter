import 'package:flutter/material.dart';

class WidgetCoin extends StatelessWidget {
  const WidgetCoin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Row(
          children: [
            Image(image: AssetImage("../../assets/coin/bitcoin.webp")),
            Container(
                margin: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("BTC",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                    Text("Bitcoin", style: TextStyle(color: Color(0xff707A8A))),
                  ],
                )),
            Spacer(),
            Text("20.000 \$",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16)),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFF05A22),
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                // color: Color(0xffD2ebd85),
                color: Color(0xfff6455f),
                // color: Colors.red,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text("-16%",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

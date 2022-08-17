import 'package:example/model/model.dart';
import 'package:flutter/material.dart';

class WidgetCoin2 extends StatefulWidget {
  final Coin coin;

  const WidgetCoin2({Key? key, required this.coin}) : super(key: key);

  @override
  State<WidgetCoin2> createState() => _WidgetCoin2State();
}

class _WidgetCoin2State extends State<WidgetCoin2> {

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
                Text("${widget.coin.symbol!='-'?widget.coin.symbol.toUpperCase():"-"}"+"/USDT",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xff707A8A))),
                Text(
                    "${num.parse(widget.coin.price_change_percentage.toStringAsFixed(2))}%",
                    style: TextStyle(
                        color:widget.coin.price_change_percentage<0?Color(0xfff6455f):Color(0xffD2ebd85),
                        fontWeight: FontWeight.w600,
                        fontSize: 16))
              ],
            ),
            Row(
              children: [
                Text("${widget.coin.price} \$",
                    style: TextStyle(
                        color: widget.coin.price_change_percentage<0?Color(0xfff6455f):Color(0xffD2ebd85),
                        fontWeight: FontWeight.w500,
                        fontSize: 18))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

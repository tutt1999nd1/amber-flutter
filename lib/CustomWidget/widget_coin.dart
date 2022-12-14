import 'dart:async';

import 'package:flutter/material.dart';

import '../api/ApiService.dart';
import '../model/model.dart';

class WidgetCoin extends StatefulWidget {
  final Coin coin;
  final String image;
  const WidgetCoin({Key? key,required this.coin,required this.image}) : super(key: key);


  @override
  State<WidgetCoin> createState() => _WidgetCoinState();
}

class _WidgetCoinState extends State<WidgetCoin> {
  Coin coin = new Coin(name: '', id: '', symbol: '', price: 0, price_change_percentage: 0);

  void _getData() async {
    print("tutt");
    Coin? a = await ApiService().getCoin(widget.coin.id);

    Future.delayed(const Duration(seconds: 1)).then((value) =>
    {
      if(mounted){
        setState(() {
          coin = a!;
        })
      }

    }
    );
    // setState(() {
    //   btc1 = b!;
    //   eth1 = e!;
    //   solana1 = s!;
    // });
  }

  @override
  void initState() {
    _getData();
    // Timer.periodic(new Duration(seconds: 3), (timer) {
    //   // _getData();
    // });

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Row(
          children: [
            Image(image: AssetImage(widget.image)),
            Container(
                margin: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${coin.symbol.toUpperCase()}",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16)),
                    Text("${coin.name}", style: TextStyle(color: Color(0xff707A8A))),
                  ],
                )),
            Spacer(),
            Text("${coin.price} \$",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16)),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: coin.price_change_percentage<0?Color(0xfff6455f):Color(0xffD2ebd85),
                  style: BorderStyle.solid,
                  width: 1.0,
                ),
                // color: Color(0xffD2ebd85),
                color: coin.price_change_percentage<0?Color(0xfff6455f):Color(0xffD2ebd85),
                // color: Colors.red,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text("${num.parse(coin.price_change_percentage.toStringAsFixed(2))} %",
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

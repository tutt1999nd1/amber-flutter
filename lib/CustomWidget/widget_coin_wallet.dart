import 'dart:async';

import 'package:flutter/material.dart';

import '../api/ApiService.dart';
import '../model/model.dart';

class WidgetCoinWallet extends StatefulWidget {
  final Coin coin;
  final String image;
  final double total;
  const WidgetCoinWallet({Key? key,required this.coin,required this.image,required this.total}) : super(key: key);


  @override
  State<WidgetCoinWallet> createState() => _WidgetCoinWalletState();
}

class _WidgetCoinWalletState extends State<WidgetCoinWallet> {
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
    Timer.periodic(new Duration(seconds: 5), (timer) {
      _getData();
    });

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
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("${widget.total}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16)),
                  Text("${num.parse((widget.total*coin.price).toStringAsFixed(2))} \$", style: TextStyle(color: Color(0xff707A8A))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:example/CustomWidget/widget_coin.dart';
import 'package:example/model/model.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:showcaseview/showcaseview.dart';

import '../../CustomWidget/widget_coin_2.dart';
import '../../api/ApiService.dart';
import '../authentication/constants/constants.dart';
import 'chartFlutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// class HomePageController {
//   void Function() methodA;
// }
class HomePage extends StatefulWidget {
  Function openDrawer;
  Function changeTabWallet;

  HomePage({required this.openDrawer, required this.changeTabWallet});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Coin btc1 = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  Coin eth1 = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  Coin solana1 = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  Coin lever = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  Coin eth = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  Coin doge = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  Coin sol = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  Coin btc = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  // final data = [
  //   new OrdinalSales('2014', 5),
  //   new OrdinalSales('2015', 25),
  //   new OrdinalSales('2016', 100),
  //   new OrdinalSales('2017', 75),
  // ];
  late List<charts.Series> seriesList;

  void _getData() async {
    print("tutt");
    Coin? b = await ApiService().getCoin("bitcoin");
    Coin? e = await ApiService().getCoin("ethereum");
    Coin? s = await ApiService().getCoin("solana");
    Coin? a = await ApiService().getCoin('lever');
    Coin? b2 = await ApiService().getCoin('ethereum');
    Coin? c = await ApiService().getCoin('dogecoin');
    Coin? d = await ApiService().getCoin('solana');
    Coin? e2 = await ApiService().getCoin('bitcoin');
    Future.delayed(const Duration(seconds: 1)).then((value) =>
    {
      if(mounted){
        setState(() {
          btc1 = b!;
          eth1 = e!;
          solana1 = s!;
          lever = a!;
          eth = b2!;
          doge = c!;
          sol = d!;
          btc = e2!;
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
      // _getData();
      _getData();

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ShowCaseWidget(
        onStart: (index, key) {},
        onComplete: (index, key) {
          // if (index == 4) {
          //   SystemChrome.setSystemUIOverlayStyle(
          //     SystemUiOverlayStyle.light.copyWith(
          //       statusBarIconBrightness: Brightness.dark,
          //       statusBarColor: Colors.white,
          //     ),
          //   );
          // }
        },
        blurValue: 1,
        // builder: Builder(builder: (context) => const BarChartSample3()),
        builder: Builder(
            builder: (context) =>
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // margin: const EdgeInsets.only(top: 10.0),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.account_circle_outlined,
                                      color: Colors.amber[800],
                                    ),
                                    onPressed: () => widget.openDrawer()),
                                Spacer(),
                                IconButton(
                                    icon: Icon(
                                      Icons.search,
                                      color: Colors.amber[800],
                                    ),
                                    onPressed: () => widget.openDrawer()),
                              ],
                            )),
                      ),
                      SizedBox(height: 20),
                      Container(
                        // margin: EdgeInsets.only(top: 30),
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tổng số dư",
                                        style: TextStyle(
                                            color: Color(0xff707A8A),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        "${num.parse((lever.price*4322580+eth.price*0.8+doge.price*3000+sol.price*18+btc.price*0.2).toStringAsFixed(4))} \$",
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer(),
                                Container(
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward_outlined,
                                        color: Colors.amber[800],
                                      ),
                                      onPressed: () =>
                                          widget.changeTabWallet(1)),
                                )
                              ],
                            )),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        flex: 1,
                        child:
                        ListView(
                          // This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                WidgetCoin2(coin: btc1),
                                WidgetCoin2(coin: solana1),
                                WidgetCoin2(coin: eth1),

                              ],
                            )
                          ],
                        ),

                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Danh sách yêu thích",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                      ),
                      Expanded(
                          flex: 12,
                          child: SingleChildScrollView(
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                  WidgetCoin(image: '../../assets/coin/bitcoin.webp',coin:Coin(name: '', id: 'bitcoin', symbol: '', price: 0, price_change_percentage: 0)),
                                  WidgetCoin(image: '../../assets/coin/cardano.webp',coin:Coin(name: '', id: 'cardano', symbol: '', price: 0, price_change_percentage: 0)),
                                  WidgetCoin(image: '../../assets/coin/ethereum.webp',coin:Coin(name: '', id: 'ethereum', symbol: '', price: 0, price_change_percentage: 0)),
                                  WidgetCoin(image: '../../assets/coin/dogecoin.webp',coin:Coin(name: '', id: 'dogecoin', symbol: '', price: 0, price_change_percentage: 0)),
                                  WidgetCoin(image: '../../assets/coin/gmt.webp',coin:Coin(name: '', id: 'stepn', symbol: '', price: 0, price_change_percentage: 0)),
                                  WidgetCoin(image: '../../assets/coin/lever.webp',coin:Coin(name: '', id: 'lever', symbol: '', price: 0, price_change_percentage: 0)),
                                  WidgetCoin(image: '../../assets/coin/near.webp',coin:Coin(name: '', id: 'near', symbol: '', price: 0, price_change_percentage: 0)),
                                  WidgetCoin(image: '../../assets/coin/polkadot.webp',coin:Coin(name: '', id: 'polkadot', symbol: '', price: 0, price_change_percentage: 0)),
                                  // WidgetCoin(image: '../../assets/coin/pond.webp',coin:Coin(name: '', id: 'marlin', symbol: '', price: 0, price_change_percentage: 0)),
                                  WidgetCoin(image: '../../assets/coin/solana.webp',coin:Coin(name: '', id: 'solana', symbol: '', price: 0, price_change_percentage: 0)),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                )),
        autoPlayDelay: const Duration(seconds: 3),
      ),
    );
  }
}

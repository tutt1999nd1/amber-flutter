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
  Coin btc1 = new Coin(name: '', id: '', symbol: '', price: 2, price_change_percentage: 0);
  Coin eth1 = new Coin(name: '', id: '', symbol: '', price: 3, price_change_percentage: 0);
  Coin solana1 = new Coin(name: '', id: '', symbol: '', price: 3, price_change_percentage: 0);

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
    Future.delayed(const Duration(seconds: 1)).then((value) =>
    {
      if(mounted){
        setState(() {
          btc1 = b!;
          eth1 = e!;
          solana1 = s!;
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
    Timer.periodic(new Duration(seconds: 3), (timer) {
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
                                        "2.000 \$",
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
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
                                    WidgetCoin(),
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

import 'dart:async';
import 'dart:core';

import 'package:example/CustomWidget/widget_coin.dart';
import 'package:example/CustomWidget/widget_coin_wallet.dart';
import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import '../../api/ApiService.dart';
import '../../model/model.dart';
class AccountPage extends StatefulWidget {
  Function openDrawer;
  Function changeTabWallet;
  AccountPage({required this.openDrawer, required this.changeTabWallet});
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  double totalWallet = 0;
  Coin lever = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  Coin eth = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  Coin doge = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  Coin sol = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);
  Coin btc = new Coin(name: '', id: '', symbol: '-', price: 0, price_change_percentage: 0);


  late List<ChartData>  _chartData;
  late TooltipBehavior _tooltipBehavior;


  List<ChartData> getChartData(){
    final List<ChartData> chartData = [
      ChartData('Lever',67),
      ChartData('Sol',7),
      ChartData('Btc',5),
      ChartData('Eth',12),
      ChartData('Doge',9),
    ];
    return chartData;
  }
  // final data = [
  //   new OrdinalSales('2014', 5),
  //   new OrdinalSales('2015', 25),
  //   new OrdinalSales('2016', 100),
  //   new OrdinalSales('2017', 75),
  // ];

  void _getData() async {
    print("tutt");
    Coin? a = await ApiService().getCoin('lever');
    Coin? b = await ApiService().getCoin('ethereum');
    Coin? c = await ApiService().getCoin('dogecoin');
    Coin? d = await ApiService().getCoin('solana');
    Coin? e = await ApiService().getCoin('bitcoin');
    Future.delayed(const Duration(seconds: 1)).then((value) =>
    {
      if(mounted){
        setState(() {
          lever = a!;
          eth = b!;
          doge = c!;
          sol = d!;
          btc = e!;
        })
      }

    }
    );
  }

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
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
                      // Container(
                      //   // margin: const EdgeInsets.only(top: 10.0),
                      //   child: Padding(
                      //       padding: const EdgeInsets.symmetric(horizontal: 10),
                      //       child: Row(
                      //         children: [
                      //           IconButton(
                      //               icon: Icon(
                      //                 Icons.account_circle_outlined,
                      //                 color: Colors.amber[800],
                      //               ),
                      //               onPressed: () => widget.openDrawer()),
                      //           Spacer(),
                      //           IconButton(
                      //               icon: Icon(
                      //                 Icons.search,
                      //                 color: Colors.amber[800],
                      //               ),
                      //               onPressed: () => widget.openDrawer()),
                      //         ],
                      //       )),
                      // ),
                      SizedBox(height: 60),
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

                              ],
                            )),
                      ),
                      SizedBox(height: 20),
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Phân bổ tài sản",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                      ),
                      Container(
                        child: SfCircularChart(
                          legend: Legend(isVisible: true,overflowMode: LegendItemOverflowMode.wrap),
                          tooltipBehavior: _tooltipBehavior,
                          series: [
                            DoughnutSeries<ChartData,String>(
                                dataSource:  _chartData,
                                xValueMapper: (ChartData data,_)=> data.x,
                                yValueMapper: (ChartData data,_)=> data.y,
                                dataLabelMapper: (ChartData data,_)=> data.y.toString()+"%",
                                dataLabelSettings:  DataLabelSettings(isVisible: true,  labelPosition: ChartDataLabelPosition.outside,
                                    // Renders background rectangle and fills it with series color
                                    useSeriesColor: true),
                                enableTooltip: true
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
                            "Tài sản",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16,),
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
                                    WidgetCoinWallet(image: 'assets/coin/lever.webp',coin:Coin(name: '', id: 'lever', symbol: '', price: 0, price_change_percentage: 0),total: 4322580,),
                                    WidgetCoinWallet(image: 'assets/coin/ethereum.webp',coin:Coin(name: '', id: 'ethereum', symbol: '', price: 0, price_change_percentage: 0),total: 0.8),
                                    WidgetCoinWallet(image: 'assets/coin/dogecoin.webp',coin:Coin(name: '', id: 'dogecoin', symbol: '', price: 0, price_change_percentage: 0),total: 3000),
                                    WidgetCoinWallet(image: 'assets/coin/solana.webp',coin:Coin(name: '', id: 'solana', symbol: '', price: 0, price_change_percentage: 0),total: 18),
                                    WidgetCoinWallet(image: 'assets/coin/bitcoin.webp',coin:Coin(name: '', id: 'bitcoin', symbol: '', price: 0, price_change_percentage: 0),total: 0.2),
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



class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
  // final Color color;
}
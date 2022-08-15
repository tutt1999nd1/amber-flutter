import 'package:example/CustomWidget/widget_coin.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:showcaseview/showcaseview.dart';

import '../authentication/constants/constants.dart';
import 'chartFlutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;

// class HomePageController {
//   void Function() methodA;
// }
class HomePage extends StatefulWidget {
  Function openDrawer;
  Function changeTabWallet;

  HomePage({required this.openDrawer,required this.changeTabWallet});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final data = [
  //   new OrdinalSales('2014', 5),
  //   new OrdinalSales('2015', 25),
  //   new OrdinalSales('2016', 100),
  //   new OrdinalSales('2017', 75),
  // ];
  late List<charts.Series> seriesList;

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
            builder: (context) => Container(
                  color: Colors.red,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
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
                      Container(
                        color: Colors.blue,
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Container(
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Tổng số dư",
                                        style:
                                        TextStyle(color: Color(0xff9fa1ad)),
                                      ),
                                      Text(
                                        "2.000 \$",
                                        style:
                                        TextStyle(fontSize: 30),
                                      ),
                                    ],
                                  ) ,
                                ),
                                Spacer(),
                                Container(
                                  child:  IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward_outlined,
                                        color: Colors.amber[800],
                                      ),
                                      onPressed: () => widget.changeTabWallet(1)),
                                )
                              ],
                            )),
                      ),
                      Expanded(
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(20),
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          crossAxisCount: 1,
                          children: <Widget>[
                            WidgetCoin(),
                            WidgetCoin(),
                            WidgetCoin(),
                            WidgetCoin(),
                            WidgetCoin(),
                            WidgetCoin(),
                            WidgetCoin(),
                          ],
                        )
                      ),
                    ],
                  ),
                )),
        autoPlayDelay: const Duration(seconds: 3),
      ),
    );
  }
}

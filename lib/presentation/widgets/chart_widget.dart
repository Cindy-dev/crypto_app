import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../data/model/chart_model.dart';

class Chart extends StatefulWidget {
  final ChartModel chartModel;
  const Chart({Key? key, required this.chartModel}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ChartState();
}

class ChartState extends State<Chart> {
  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(
        0,
        widget.chartModel.marketData!.priceChangePercentage1HInCurrency!["usd"]!
            .toDouble());
    final barGroup2 = makeGroupData(
        1,
        widget
            .chartModel.marketData!.priceChangePercentage24HInCurrency!["usd"]!
            .toDouble());
    final barGroup3 = makeGroupData(
        2,
        widget.chartModel.marketData!.priceChangePercentage7DInCurrency!["usd"]!
            .toDouble());
    final barGroup4 = makeGroupData(
        3,
        widget
            .chartModel.marketData!.priceChangePercentage14DInCurrency!["usd"]!
            .toDouble());
    final barGroup5 = makeGroupData(
        4,
        widget
            .chartModel.marketData!.priceChangePercentage30DInCurrency!["usd"]!
            .toDouble());
    final barGroup6 = makeGroupData(
        5,
        widget
            .chartModel.marketData!.priceChangePercentage60DInCurrency!["usd"]!
            .toDouble());
    final barGroup7 = makeGroupData(
        6,
        widget
            .chartModel.marketData!.priceChangePercentage200DInCurrency!["usd"]!
            .toDouble());
    final barGroup8 = makeGroupData(
        7,
        widget
            .chartModel.marketData!.priceChangePercentage200DInCurrency!["usd"]!
            .toDouble());

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
      barGroup8
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        color: const Color(0xff2c4260),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisSize: MainAxisSize.min,
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: <Widget>[
              //     makeTransactionsIcon(),
              //     const SizedBox(
              //       width: 38,
              //     ),
              //     const Text(
              //       'Transactions',
              //       style: TextStyle(color: Colors.white, fontSize: 22),
              //     ),
              //     const SizedBox(
              //       width: 4,
              //     ),
              //     const Text(
              //       'state',
              //       style: TextStyle(color: Color(0xff77839a), fontSize: 16),
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 38,
              ),
              Expanded(
                child: BarChart(
                  BarChartData(
                    maxY: 20,
                    barTouchData: BarTouchData(
                        touchTooltipData: BarTouchTooltipData(
                          tooltipBgColor: Colors.grey,
                          getTooltipItem: (_a, _b, _c, _d) => null,
                        ),
                        touchCallback: (FlTouchEvent event, response) {
                          if (response == null || response.spot == null) {
                            setState(() {
                              touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                            });
                            return;
                          }

                          touchedGroupIndex =
                              response.spot!.touchedBarGroupIndex;

                          setState(() {
                            if (!event.isInterestedForInteractions) {
                              touchedGroupIndex = -1;
                              showingBarGroups = List.of(rawBarGroups);
                              return;
                            }
                            showingBarGroups = List.of(rawBarGroups);
                            if (touchedGroupIndex != -1) {
                              var sum = 0.0;
                              for (var rod
                                  in showingBarGroups[touchedGroupIndex]
                                      .barRods) {
                                sum += rod.toY;
                              }
                              final avg = sum /
                                  showingBarGroups[touchedGroupIndex]
                                      .barRods
                                      .length;

                              showingBarGroups[touchedGroupIndex] =
                                  showingBarGroups[touchedGroupIndex].copyWith(
                                barRods: showingBarGroups[touchedGroupIndex]
                                    .barRods
                                    .map((rod) {
                                  return rod.copyWith(toY: avg);
                                }).toList(),
                              );
                            }
                          });
                        }),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: bottomTitles,
                          reservedSize: 42,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          interval: 1,
                          getTitlesWidget: leftTitles,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(
                      show: false,
                    ),
                    barGroups: showingBarGroups,
                    gridData: FlGridData(show: false),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 100) {
      text = widget.chartModel.marketData!.ath!["usd"].toString();
    } else if (value < 100) {
      text = widget.chartModel.marketData!.currentPrice!["usd"].toString();
    } else if (value == 59) {
      text = widget.chartModel.marketData!.currentPrice!["usd"].toString();
    } else {
      return Container();
    }
    return SideTitleWidget(axisSide: meta.axisSide, space: 0, child: Text(text)
        //widget.chartModel.marketData!.currentPrice!["usd"]!.toStringAsFixed(2), style: style),
        );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    List<String> titles = [
      "1hr",
      "24hr",
      "7d",
      "14d",
      "30d",
      "60d",
      "200d",
      "1yr"
    ];

    Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        toY: y1,
        color: leftBarColor,
        width: width,
      ),
      // BarChartRodData(
      //   toY: y2,
      //   color: rightBarColor,
      //   width: width,
      // ),
    ]);
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import '../../data/model/chart_model.dart' as chart;
// import '../../data/model/chart_model.dart';
// import 'package:intl/intl.dart';
//
// class Chart extends StatelessWidget {
//   final ChartModel chartModel;
//   final String id;
//   const Chart({Key? key, required this.chartModel, required this.id})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final List<chart.Ticker> chartData = [
//       chart.Ticker(
//           lastFetchAt: chartModel.marketData!.atlDate![chartModel.symbol],
//           convertedVolume: chartModel.marketData!.athChangePercentage,
//           last:
//           chartModel.marketData!.priceChangePercentage1HInCurrency!["usd"],
//           coinId: id),
//       chart.Ticker(
//           lastFetchAt: chartModel.marketData!.atlDate![chartModel.symbol],
//           convertedVolume: chartModel.marketData!.athChangePercentage,
//           last:
//               chartModel.marketData!.priceChangePercentage24HInCurrency!["usd"],
//           coinId: id),
//       chart.Ticker(
//           lastFetchAt: chartModel.marketData!.atlDate![chartModel.symbol],
//           convertedVolume: chartModel.marketData!.athChangePercentage,
//           last:
//           chartModel.marketData!.priceChangePercentage7DInCurrency!["usd"],
//           coinId: id),
//
//       // ChartData(2010, 35),
//       // ChartData(2011, 28),
//       // SalesData(2012, 34),
//       // SalesData(2013, 32),
//       // SalesData(2014, 40)
//     ];
//     return Container(
//         child: SfCartesianChart(
//             primaryXAxis: DateTimeAxis(),
//             series: <ChartSeries>[
//           // Renders line chart
//           FastLineSeries<chart.Ticker, DateTime>(
//               dataSource: chartData,
//               xValueMapper: (chart.Ticker data, _) => DateFormat("yyyy-MM-DD")
//                   .parse(data.lastFetchAt!.toIso8601String()),
//               yValueMapper: (chart.Ticker data, _) => data.last ?? 0)
//         ]));
//   }
// }

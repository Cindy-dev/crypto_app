import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../data/model/chart_model.dart' as chart;
import '../../data/model/chart_model.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final ChartModel chartModel;
  final String id;
  const Chart({Key? key, required this.chartModel, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<chart.Ticker> chartData = [
      chart.Ticker(
          lastFetchAt: chartModel.marketData!.atlDate![chartModel.symbol],
          convertedVolume: chartModel.marketData!.athChangePercentage,
          last:
          chartModel.marketData!.priceChangePercentage1HInCurrency!["usd"],
          coinId: id),
      chart.Ticker(
          lastFetchAt: chartModel.marketData!.atlDate![chartModel.symbol],
          convertedVolume: chartModel.marketData!.athChangePercentage,
          last:
              chartModel.marketData!.priceChangePercentage24HInCurrency!["usd"],
          coinId: id),
      chart.Ticker(
          lastFetchAt: chartModel.marketData!.atlDate![chartModel.symbol],
          convertedVolume: chartModel.marketData!.athChangePercentage,
          last:
          chartModel.marketData!.priceChangePercentage7DInCurrency!["usd"],
          coinId: id),

      // ChartData(2010, 35),
      // ChartData(2011, 28),
      // SalesData(2012, 34),
      // SalesData(2013, 32),
      // SalesData(2014, 40)
    ];
    return Container(
        child: SfCartesianChart(
            primaryXAxis: DateTimeAxis(),
            series: <ChartSeries>[
          // Renders line chart
          FastLineSeries<chart.Ticker, DateTime>(
              dataSource: chartData,
              xValueMapper: (chart.Ticker data, _) => DateFormat("yyyy-MM-DD")
                  .parse(data.lastFetchAt!.toIso8601String()),
              yValueMapper: (chart.Ticker data, _) => data.last ?? 0)
        ]));
  }
}

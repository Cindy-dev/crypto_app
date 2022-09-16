import 'package:crypto_app/data/model/chart_model.dart';

abstract class ChartDataManagerImpl {
  Future<ChartModel> getCryptoChart(String id);
}

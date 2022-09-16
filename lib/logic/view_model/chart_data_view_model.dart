import 'package:crypto_app/data/model/chart_model.dart';
import 'package:crypto_app/logic/manager/chart_dm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/request_view_model.dart';

class CryptoChartDataViewModel extends RequestStateNotifier<ChartModel> {
  final CryptoChartDataManager cryptoChartDataManager;

  CryptoChartDataViewModel(Ref ref)
      : cryptoChartDataManager = ref.read(cryptoChartDataManagerProvider);

  void getCoins(String id) =>
      makeRequest(() => cryptoChartDataManager.getCryptoChart(id));
}

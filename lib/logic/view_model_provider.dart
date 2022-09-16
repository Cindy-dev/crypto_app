import 'package:crypto_app/data/model/chart_model.dart';
import 'package:crypto_app/logic/manager/crypto_dm.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'manager/chart_dm.dart';

final cryptoDataProvider = FutureProvider.autoDispose((ref) {
  ref.maintainState = true;
  return ref.watch(cryptoDataManagerProvider).getCoins();
});

final cryptoChartDataProvider =
    FutureProvider.family<ChartModel, String>((ref, id) {
  return ref.watch(cryptoChartDataManagerProvider).getCryptoChart(id);
});

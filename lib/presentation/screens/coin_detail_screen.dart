import 'package:crypto_app/data/model/crypto_model.dart';
import 'package:crypto_app/logic/view_model_provider.dart';
import 'package:crypto_app/presentation/utils/constants/device_size.dart';
import 'package:crypto_app/presentation/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../utils/constants/colors.dart';

class CoinDetailScreen extends StatefulHookConsumerWidget {
  final CryptoModel cryptoModel;
  final String id;
  const CoinDetailScreen(
      {Key? key, required this.cryptoModel, required this.id})
      : super(key: key);

  @override
  ConsumerState<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends ConsumerState<CoinDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(cryptoChartDataProvider(widget.id));
    var priceFormat = NumberFormat("###,###", "en_US");
    final string =
        widget.cryptoModel.priceChangePercentage24H!.toStringAsFixed(2);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.cryptoModel.name!),
        backgroundColor: pColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            viewModel.when(
                data: (data) {
                  return Chart(
                    chartModel: data,
                    // id: widget.id!,
                  );
                },
                error: (e, st) {
                  print(e.toString());
                  return Text(e.toString());
                },
                loading: () => const CircularProgressIndicator()),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: tColor,
                  width: context.screenWidth() / 7,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 17),
                  child: Image.network(
                    widget.cryptoModel.image.toString(),
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.cryptoModel.name!,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: wColor,
                            fontSize: 16)),
                    Text(widget.cryptoModel.symbol!.toUpperCase(),
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            color: blackAsh,
                            fontSize: 14)),
                  ],
                ),
                const SizedBox(width: 22),
                const Spacer(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                        '\$${priceFormat.format(widget.cryptoModel.currentPrice!)}',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            color: wColor,
                            fontSize: 16)),
                    widget.cryptoModel.priceChangePercentage24H!
                            .toString()
                            .contains('-')
                        ? Text('$string%',
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: dipColor,
                                fontSize: 14))
                        : Text('+$string%',
                            textAlign: TextAlign.end,
                            style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w400,
                                color: greenColor,
                                fontSize: 14)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:crypto_app/logic/view_model_provider.dart';
import 'package:crypto_app/presentation/screens/coin_detail_screen.dart';
import 'package:crypto_app/presentation/utils/constants/colors.dart';
import 'package:crypto_app/presentation/utils/constants/device_size.dart';
import 'package:crypto_app/presentation/utils/constants/navigators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CoinDataWidget extends StatefulHookConsumerWidget {
  const CoinDataWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<CoinDataWidget> createState() => _CoinDataWidgetState();
}

class _CoinDataWidgetState extends ConsumerState<CoinDataWidget> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final result = ref.watch(cryptoDataProvider);
        return result.when(
            loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
            data: (data) {
              return MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      final string = data![index]
                          .priceChangePercentage24H!
                          .toStringAsFixed(2);
                      return InkWell(
                        onTap: () {
                          navigatePush(
                              context,
                              CoinDetailScreen(
                                cryptoModel: data[index],
                                id: data![index].id!,
                              ));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  color: tColor,
                                  width: context.screenWidth() / 7,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 17),
                                  child: Image.network(
                                    data![index].image.toString(),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data![index].name!,
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700,
                                            color: wColor,
                                            fontSize: 16)),
                                    Text(data![index].symbol!.toUpperCase(),
                                        style: const TextStyle(
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400,
                                            color: blackAsh,
                                            fontSize: 14)),
                                  ],
                                ),
                                const SizedBox(width: 22),
                                const Spacer(),
                                data[index]!
                                        .priceChangePercentage24H!
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
                          ),
                        ),
                      );
                    }),
              );
            },
            error: (e, s) => Text(e.toString()));
      },
    );
  }
}

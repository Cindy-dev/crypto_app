import 'package:crypto_app/presentation/utils/constants/device_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../logic/view_model_provider.dart';
import '../utils/constants/colors.dart';

class CoinDetailScreen extends StatefulHookConsumerWidget {
  final int id;
  final int name;
  const CoinDetailScreen({Key? key, required this.id, required this.name}) : super(key: key);

  @override
  ConsumerState<CoinDetailScreen> createState() => _CoinDetailScreenState();
}

class _CoinDetailScreenState extends ConsumerState<CoinDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(
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
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
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
                        );
                      }),
                );
              },
              error: (e, s) => Text(e.toString()));
        },
      ),
    );
  }
}

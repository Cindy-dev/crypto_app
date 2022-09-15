// To parse this JSON data, do
//
//     final chartModel = chartModelFromJson(jsonString);

import 'dart:convert';

ChartModel chartModelFromJson(String str) =>
    ChartModel.fromJson(json.decode(str));

String chartModelToJson(ChartModel data) => json.encode(data.toJson());

class ChartModel {
  ChartModel({
    this.id,
    this.symbol,
    this.name,
    this.assetPlatformId,
    this.platforms,
    this.detailPlatforms,
    this.blockTimeInMinutes,
    this.hashingAlgorithm,
    this.categories,
    this.publicNotice,
    this.additionalNotices,
    this.description,
    this.links,
    this.image,
    this.countryOrigin,
    this.genesisDate,
    this.sentimentVotesUpPercentage,
    this.sentimentVotesDownPercentage,
    this.marketCapRank,
    this.coingeckoRank,
    this.coingeckoScore,
    this.developerScore,
    this.communityScore,
    this.liquidityScore,
    this.publicInterestScore,
    this.marketData,
    this.publicInterestStats,
    this.statusUpdates,
    this.lastUpdated,
    this.tickers,
  });

  Id? id;
  String? symbol;
  String? name;
  dynamic? assetPlatformId;
  Platforms? platforms;
  DetailPlatforms? detailPlatforms;
  num? blockTimeInMinutes;
  String? hashingAlgorithm;
  List<String>? categories;
  dynamic? publicNotice;
  List<dynamic>? additionalNotices;
  Description? description;
  Links? links;
  Image? image;
  String? countryOrigin;
  DateTime? genesisDate;
  double? sentimentVotesUpPercentage;
  double? sentimentVotesDownPercentage;
  num? marketCapRank;
  num? coingeckoRank;
  num? coingeckoScore;
  num? developerScore;
  num? communityScore;
  num? liquidityScore;
  num? publicInterestScore;
  MarketData? marketData;
  PublicInterestStats? publicInterestStats;
  List<dynamic>? statusUpdates;
  DateTime? lastUpdated;
  List<Ticker>? tickers;

  factory ChartModel.fromJson(Map<String, dynamic> json) => ChartModel(
        id: idValues.map[json["id"]],
        symbol: json["symbol"],
        name: json["name"],
        assetPlatformId: json["asset_platform_id"],
        platforms: Platforms.fromJson(json["platforms"]),
        detailPlatforms: DetailPlatforms.fromJson(json["detail_platforms"]),
        blockTimeInMinutes: json["block_time_in_minutes"],
        hashingAlgorithm: json["hashing_algorithm"],
        categories: List<String>.from(json["categories"].map((x) => x)),
        publicNotice: json["public_notice"],
        additionalNotices:
            List<dynamic>.from(json["additional_notices"].map((x) => x)),
        description: Description.fromJson(json["description"]),
        links: Links.fromJson(json["links"]),
        image: Image.fromJson(json["image"]),
        countryOrigin: json["country_origin"],
        genesisDate: DateTime.parse(json["genesis_date"]),
        sentimentVotesUpPercentage:
            json["sentiment_votes_up_percentage"].toDouble(),
        sentimentVotesDownPercentage:
            json["sentiment_votes_down_percentage"].toDouble(),
        marketCapRank: json["market_cap_rank"],
        coingeckoRank: json["coingecko_rank"],
        coingeckoScore: json["coingecko_score"].toDouble(),
        developerScore: json["developer_score"].toDouble(),
        communityScore: json["community_score"].toDouble(),
        liquidityScore: json["liquidity_score"].toDouble(),
        publicInterestScore: json["public_interest_score"].toDouble(),
        marketData: MarketData.fromJson(json["market_data"]),
        publicInterestStats:
            PublicInterestStats.fromJson(json["public_interest_stats"]),
        statusUpdates: List<dynamic>.from(json["status_updates"].map((x) => x)),
        lastUpdated: DateTime.parse(json["last_updated"]),
        tickers:
            List<Ticker>.from(json["tickers"].map((x) => Ticker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "symbol": symbol,
        "name": name,
        "asset_platform_id": assetPlatformId,
        "platforms": platforms!.toJson(),
        "detail_platforms": detailPlatforms!.toJson(),
        "block_time_in_minutes": blockTimeInMinutes,
        "hashing_algorithm": hashingAlgorithm,
        "categories": List<dynamic>.from(categories!.map((x) => x)),
        "public_notice": publicNotice,
        "additional_notices":
            List<dynamic>.from(additionalNotices!.map((x) => x)),
        "description": description!.toJson(),
        "links": links!.toJson(),
        "image": image!.toJson(),
        "country_origin": countryOrigin,
        "genesis_date":
            "${genesisDate!.year.toString().padLeft(4, '0')}-${genesisDate!.month.toString().padLeft(2, '0')}-${genesisDate!.day.toString().padLeft(2, '0')}",
        "sentiment_votes_up_percentage": sentimentVotesUpPercentage,
        "sentiment_votes_down_percentage": sentimentVotesDownPercentage,
        "market_cap_rank": marketCapRank,
        "coingecko_rank": coingeckoRank,
        "coingecko_score": coingeckoScore,
        "developer_score": developerScore,
        "community_score": communityScore,
        "liquidity_score": liquidityScore,
        "public_interest_score": publicInterestScore,
        "market_data": marketData!.toJson(),
        "public_interest_stats": publicInterestStats!.toJson(),
        "status_updates": List<dynamic>.from(statusUpdates!.map((x) => x)),
        "last_updated": lastUpdated!.toIso8601String(),
        "tickers": List<dynamic>.from(tickers!.map((x) => x.toJson())),
      };
}

class Description {
  Description({
    this.en,
  });

  String? en;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        en: json["en"],
      );

  Map<String, dynamic> toJson() => {
        "en": en,
      };
}

class DetailPlatforms {
  DetailPlatforms({
    this.empty,
  });

  Empty? empty;

  factory DetailPlatforms.fromJson(Map<String, dynamic> json) =>
      DetailPlatforms(
        empty: Empty.fromJson(json[""]),
      );

  Map<String, dynamic> toJson() => {
        "": empty!.toJson(),
      };
}

class Empty {
  Empty({
    this.decimalPlace,
    this.contractAddress,
  });

  dynamic decimalPlace;
  String? contractAddress;

  factory Empty.fromJson(Map<String, dynamic> json) => Empty(
        decimalPlace: json["decimal_place"],
        contractAddress: json["contract_address"],
      );

  Map<String, dynamic> toJson() => {
        "decimal_place": decimalPlace,
        "contract_address": contractAddress,
      };
}

enum Id { BITCOIN, ETHEREUM, WRAPPED_BITCOIN, ETHEREUM_CLASSIC, BINANCECOIN }

final idValues = EnumValues({
  "binancecoin": Id.BINANCECOIN,
  "bitcoin": Id.BITCOIN,
  "ethereum": Id.ETHEREUM,
  "ethereum-classic": Id.ETHEREUM_CLASSIC,
  "wrapped-bitcoin": Id.WRAPPED_BITCOIN
});

class Image {
  Image({
    this.thumb,
    this.small,
    this.large,
  });

  String? thumb;
  String? small;
  String? large;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        thumb: json["thumb"],
        small: json["small"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb,
        "small": small,
        "large": large,
      };
}

class Links {
  Links({
    this.homepage,
    this.blockchainSite,
    this.officialForumUrl,
    this.chatUrl,
    this.announcementUrl,
    this.twitterScreenName,
    this.facebookUsername,
    this.bitcointalkThreadIdentifier,
    this.telegramChannelIdentifier,
    this.subredditUrl,
    this.reposUrl,
  });

  List<String>? homepage;
  List<String>? blockchainSite;
  List<String>? officialForumUrl;
  List<String>? chatUrl;
  List<String>? announcementUrl;
  Id? twitterScreenName;
  String? facebookUsername;
  dynamic? bitcointalkThreadIdentifier;
  String? telegramChannelIdentifier;
  String? subredditUrl;
  ReposUrl? reposUrl;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        homepage: List<String>.from(json["homepage"].map((x) => x)),
        blockchainSite:
            List<String>.from(json["blockchain_site"].map((x) => x)),
        officialForumUrl:
            List<String>.from(json["official_forum_url"].map((x) => x)),
        chatUrl: List<String>.from(json["chat_url"].map((x) => x)),
        announcementUrl:
            List<String>.from(json["announcement_url"].map((x) => x)),
        twitterScreenName: idValues.map[json["twitter_screen_name"]],
        facebookUsername: json["facebook_username"],
        bitcointalkThreadIdentifier: json["bitcointalk_thread_identifier"],
        telegramChannelIdentifier: json["telegram_channel_identifier"],
        subredditUrl: json["subreddit_url"],
        reposUrl: ReposUrl.fromJson(json["repos_url"]),
      );

  Map<String, dynamic> toJson() => {
        "homepage": List<dynamic>.from(homepage!.map((x) => x)),
        "blockchain_site": List<dynamic>.from(blockchainSite!.map((x) => x)),
        "official_forum_url":
            List<dynamic>.from(officialForumUrl!.map((x) => x)),
        "chat_url": List<dynamic>.from(chatUrl!.map((x) => x)),
        "announcement_url": List<dynamic>.from(announcementUrl!.map((x) => x)),
        "twitter_screen_name": idValues.reverse[twitterScreenName],
        "facebook_username": facebookUsername,
        "bitcointalk_thread_identifier": bitcointalkThreadIdentifier,
        "telegram_channel_identifier": telegramChannelIdentifier,
        "subreddit_url": subredditUrl,
        "repos_url": reposUrl!.toJson(),
      };
}

class ReposUrl {
  ReposUrl({
    this.github,
    this.bitbucket,
  });

  List<String>? github;
  List<dynamic>? bitbucket;

  factory ReposUrl.fromJson(Map<String, dynamic> json) => ReposUrl(
        github: List<String>.from(json["github"].map((x) => x)),
        bitbucket: List<dynamic>.from(json["bitbucket"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "github": List<dynamic>.from(github!.map((x) => x)),
        "bitbucket": List<dynamic>.from(bitbucket!.map((x) => x)),
      };
}

class MarketData {
  MarketData({
    this.currentPrice,
    this.totalValueLocked,
    this.mcapToTvlRatio,
    this.fdvToTvlRatio,
    this.roi,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.priceChangePercentage7D,
    this.priceChangePercentage14D,
    this.priceChangePercentage30D,
    this.priceChangePercentage60D,
    this.priceChangePercentage200D,
    this.priceChangePercentage1Y,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.priceChange24HInCurrency,
    this.priceChangePercentage1HInCurrency,
    this.priceChangePercentage24HInCurrency,
    this.priceChangePercentage7DInCurrency,
    this.priceChangePercentage14DInCurrency,
    this.priceChangePercentage30DInCurrency,
    this.priceChangePercentage60DInCurrency,
    this.priceChangePercentage200DInCurrency,
    this.priceChangePercentage1YInCurrency,
    this.marketCapChange24HInCurrency,
    this.marketCapChangePercentage24HInCurrency,
    this.totalSupply,
    this.maxSupply,
    this.circulatingSupply,
    this.lastUpdated,
  });

  Map<String, num>? currentPrice;
  dynamic totalValueLocked;
  dynamic mcapToTvlRatio;
  dynamic fdvToTvlRatio;
  dynamic roi;
  Map<String, num>? ath;
  Map<String, num>? athChangePercentage;
  Map<String, DateTime>? athDate;
  Map<String, num>? atl;
  Map<String, num>? atlChangePercentage;
  Map<String, DateTime>? atlDate;
  Map<String, num>? marketCap;
  int? marketCapRank;
  Map<String, num>? fullyDilutedValuation;
  Map<String, num>? totalVolume;
  Map<String, num>? high24H;
  Map<String, num>? low24H;
  num? priceChange24H;
  num? priceChangePercentage24H;
  num? priceChangePercentage7D;
  num? priceChangePercentage14D;
  num? priceChangePercentage30D;
  num? priceChangePercentage60D;
  num? priceChangePercentage200D;
  num? priceChangePercentage1Y;
  num? marketCapChange24H;
  num? marketCapChangePercentage24H;
  Map<String, num>? priceChange24HInCurrency;
  Map<String, num>? priceChangePercentage1HInCurrency;
  Map<String, num>? priceChangePercentage24HInCurrency;
  Map<String, num>? priceChangePercentage7DInCurrency;
  Map<String, num>? priceChangePercentage14DInCurrency;
  Map<String, num>? priceChangePercentage30DInCurrency;
  Map<String, num>? priceChangePercentage60DInCurrency;
  Map<String, num>? priceChangePercentage200DInCurrency;
  Map<String, num>? priceChangePercentage1YInCurrency;
  Map<String, num>? marketCapChange24HInCurrency;
  Map<String, num>? marketCapChangePercentage24HInCurrency;
  num? totalSupply;
  num? maxSupply;
  num? circulatingSupply;
  DateTime? lastUpdated;
  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        currentPrice: Map.from(json["current_price"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        totalValueLocked: json["total_value_locked"],
        mcapToTvlRatio: json["mcap_to_tvl_ratio"],
        fdvToTvlRatio: json["fdv_to_tvl_ratio"],
        roi: json["roi"],
        ath: Map.from(json["ath"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        athChangePercentage: Map.from(json["ath_change_percentage"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        athDate: Map.from(json["ath_date"])
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        atl: Map.from(json["atl"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        atlChangePercentage: Map.from(json["atl_change_percentage"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        atlDate: Map.from(json["atl_date"])
            .map((k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        marketCap: Map.from(json["market_cap"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: Map.from(json["fully_diluted_valuation"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        totalVolume: Map.from(json["total_volume"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        high24H: Map.from(json["high_24h"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        low24H: Map.from(json["low_24h"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChange24H: json["price_change_24h"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
        priceChangePercentage7D: json["price_change_percentage_7d"].toDouble(),
        priceChangePercentage14D:
            json["price_change_percentage_14d"].toDouble(),
        priceChangePercentage30D:
            json["price_change_percentage_30d"].toDouble(),
        priceChangePercentage60D:
            json["price_change_percentage_60d"].toDouble(),
        priceChangePercentage200D:
            json["price_change_percentage_200d"].toDouble(),
        priceChangePercentage1Y: json["price_change_percentage_1y"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"].toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"].toDouble(),
        priceChange24HInCurrency: Map.from(json["price_change_24h_in_currency"])
            .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1HInCurrency:
            Map.from(json["price_change_percentage_1h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage24HInCurrency:
            Map.from(json["price_change_percentage_24h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage7DInCurrency:
            Map.from(json["price_change_percentage_7d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage14DInCurrency:
            Map.from(json["price_change_percentage_14d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage30DInCurrency:
            Map.from(json["price_change_percentage_30d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage60DInCurrency:
            Map.from(json["price_change_percentage_60d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage200DInCurrency:
            Map.from(json["price_change_percentage_200d_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        priceChangePercentage1YInCurrency:
            Map.from(json["price_change_percentage_1y_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapChange24HInCurrency:
            Map.from(json["market_cap_change_24h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        marketCapChangePercentage24HInCurrency:
            Map.from(json["market_cap_change_percentage_24h_in_currency"])
                .map((k, v) => MapEntry<String, double>(k, v.toDouble())),
        totalSupply: json["total_supply"],
        maxSupply: json["max_supply"],
        circulatingSupply: json["circulating_supply"],
        lastUpdated: DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "current_price": Map.from(currentPrice!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(currentPrice!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_value_locked":
            totalValueLocked == null ? null : totalValueLocked,
        "mcap_to_tvl_ratio": mcapToTvlRatio == null ? null : mcapToTvlRatio,
        "fdv_to_tvl_ratio": fdvToTvlRatio == null ? null : fdvToTvlRatio,
        "roi": roi == null ? null : roi,
        "ath": Map.from(ath!).map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(ath!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_change_percentage": Map.from(athChangePercentage!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(athChangePercentage!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_date": Map.from(athDate!).map((k, v) =>
                    MapEntry<String, dynamic>(k, v.toIso8601String())) ==
                null
            ? null
            : Map.from(athDate!).map(
                (k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "atl": Map.from(atl!).map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(atl!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_change_percentage": Map.from(atlChangePercentage!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(atlChangePercentage!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_date": Map.from(atlDate!).map((k, v) =>
                    MapEntry<String, dynamic>(k, v.toIso8601String())) ==
                null
            ? null
            : Map.from(atlDate!).map(
                (k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "market_cap": Map.from(marketCap!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(marketCap!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_rank": marketCapRank == null ? null : marketCapRank,
        "fully_diluted_valuation": Map.from(fullyDilutedValuation!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(fullyDilutedValuation!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_volume": Map.from(totalVolume!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(totalVolume!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "high_24h": Map.from(high24H!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(high24H!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "low_24h": Map.from(low24H!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(low24H!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_24h": priceChange24H == null ? null : priceChange24H,
        "price_change_percentage_24h":
            priceChangePercentage24H == null ? null : priceChangePercentage24H,
        "price_change_percentage_7d":
            priceChangePercentage7D == null ? null : priceChangePercentage7D,
        "price_change_percentage_14d":
            priceChangePercentage14D == null ? null : priceChangePercentage14D,
        "price_change_percentage_30d":
            priceChangePercentage30D == null ? null : priceChangePercentage30D,
        "price_change_percentage_60d":
            priceChangePercentage60D == null ? null : priceChangePercentage60D,
        "price_change_percentage_200d": priceChangePercentage200D == null
            ? null
            : priceChangePercentage200D,
        "price_change_percentage_1y":
            priceChangePercentage1Y == null ? null : priceChangePercentage1Y,
        "market_cap_change_24h":
            marketCapChange24H == null ? null : marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H == null
            ? null
            : marketCapChangePercentage24H,
        "price_change_24h_in_currency": Map.from(priceChange24HInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(priceChange24HInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1h_in_currency":
            Map.from(priceChangePercentage1HInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage1HInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_24h_in_currency":
            Map.from(priceChangePercentage24HInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage24HInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_7d_in_currency":
            Map.from(priceChangePercentage7DInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage7DInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_14d_in_currency":
            Map.from(priceChangePercentage14DInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage14DInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_30d_in_currency":
            Map.from(priceChangePercentage30DInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage30DInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_60d_in_currency":
            Map.from(priceChangePercentage60DInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage60DInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_200d_in_currency":
            Map.from(priceChangePercentage200DInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage200DInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1y_in_currency":
            Map.from(priceChangePercentage1YInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage1YInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_24h_in_currency":
            Map.from(marketCapChange24HInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(marketCapChange24HInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_percentage_24h_in_currency":
            Map.from(marketCapChangePercentage24HInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(marketCapChangePercentage24HInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_supply": totalSupply == null ? null : totalSupply,
        "max_supply": maxSupply == null ? null : maxSupply,
        "circulating_supply":
            circulatingSupply == null ? null : circulatingSupply,
        "last_updated": lastUpdated!.toIso8601String() == null
            ? null
            : lastUpdated!.toIso8601String(),
      };
}

class Platforms {
  Platforms({
    this.empty,
  });

  String? empty;

  factory Platforms.fromJson(Map<String, dynamic> json) => Platforms(
        empty: json[""],
      );

  Map<String, dynamic> toJson() => {
        "": empty,
      };
}

class PublicInterestStats {
  PublicInterestStats({
    this.alexaRank,
    this.bingMatches,
  });

  num? alexaRank;
  dynamic bingMatches;

  factory PublicInterestStats.fromJson(Map<String, dynamic> json) =>
      PublicInterestStats(
        alexaRank: json["alexa_rank"],
        bingMatches: json["bing_matches"],
      );

  Map<String, dynamic> toJson() => {
        "alexa_rank": alexaRank,
        "bing_matches": bingMatches,
      };
}

class Ticker {
  Ticker({
    this.base,
    this.target,
    this.market,
    this.last,
    this.volume,
    this.convertedLast,
    this.convertedVolume,
    this.trustScore,
    this.bidAskSpreadPercentage,
    this.timestamp,
    this.lastTradedAt,
    this.lastFetchAt,
    this.isAnomaly,
    this.isStale,
    this.tradeUrl,
    this.tokenInfoUrl,
    this.coinId,
    this.targetCoinId,
  });

  String? base;
  String? target;
  Market? market;
  num? last;
  num? volume;
  Map<String, num>? convertedLast;
  Map<String, num>? convertedVolume;
  TrustScore? trustScore;
  num? bidAskSpreadPercentage;
  DateTime? timestamp;
  DateTime? lastTradedAt;
  DateTime? lastFetchAt;
  bool? isAnomaly;
  bool? isStale;
  String? tradeUrl;
  dynamic? tokenInfoUrl;
  String? coinId;
  Id? targetCoinId;

  factory Ticker.fromJson(Map<String, dynamic> json) => Ticker(
        base: json["base"] == null ? null : json["base"],
        target: json["target"] == null ? null : json["target"],
        market: Market.fromJson(json["market"]) == null
            ? null
            : Market.fromJson(json["market"]),
        last: json["last"] == null ? null : json["last"],
        volume: json["volume"] == null ? null : json["volume"].toDouble(),
        convertedLast: Map.from(json["converted_last"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["converted_last"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        convertedVolume: Map.from(json["converted_volume"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["converted_volume"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        trustScore: trustScoreValues.map[json["trust_score"]] == null
            ? null
            : trustScoreValues.map[json["trust_score"]],
        bidAskSpreadPercentage: json["bid_ask_spread_percentage"] == null
            ? null
            : json["bid_ask_spread_percentage"],
        timestamp: DateTime.parse(json["timestamp"]) == null
            ? null
            : DateTime.parse(json["timestamp"]),
        lastTradedAt: DateTime.parse(json["last_traded_at"]) == null
            ? null
            : DateTime.parse(json["last_traded_at"]),
        lastFetchAt: DateTime.parse(json["last_fetch_at"]) == null
            ? null
            : DateTime.parse(json["last_fetch_at"]),
        isAnomaly: json["is_anomaly"] == null ? null : json["is_anomaly"],
        isStale: json["is_stale"] == null ? null : json["is_stale"],
        tradeUrl: json["trade_url"] == null ? null : json["trade_url"],
        tokenInfoUrl:
            json["token_info_url"] == null ? null : json["token_info_url"],
        coinId: json["coin_id"] == null ? null : json["coin_id"],
        targetCoinId: json["target_coin_id"] == null
            ? null
            : idValues.map[json["target_coin_id"]],
      );

  Map<String, dynamic> toJson() => {
        "base": base == null ? null : base,
        "target": target == null ? null : target,
        "market": market!.toJson() == null ? null : market!.toJson(),
        "last": last == null ? null : last,
        "volume": volume == null ? null : volume,
        "converted_last": Map.from(convertedLast!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(convertedLast!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "converted_volume": Map.from(convertedVolume!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(convertedVolume!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "trust_score": trustScoreValues.reverse[trustScore] == null
            ? null
            : trustScoreValues.reverse[trustScore],
        "bid_ask_spread_percentage":
            bidAskSpreadPercentage == null ? null : bidAskSpreadPercentage,
        "timestamp": timestamp!.toIso8601String() == null
            ? null
            : timestamp!.toIso8601String(),
        "last_traded_at": lastTradedAt!.toIso8601String() == null
            ? null
            : lastTradedAt!.toIso8601String(),
        "last_fetch_at": lastFetchAt!.toIso8601String() == null
            ? null
            : lastFetchAt!.toIso8601String(),
        "is_anomaly": isAnomaly == null ? null : isAnomaly,
        "is_stale": isStale == null ? null : isStale,
        "trade_url": tradeUrl == null ? null : tradeUrl,
        "token_info_url": tokenInfoUrl == null ? null : tokenInfoUrl,
        "coin_id": coinId == null ? null : coinId,
        "target_coin_id":
            targetCoinId == null ? null : idValues.reverse[targetCoinId],
      };
}

enum Base { BTC, ETH, WBTC, ETC, BNB }

final baseValues = EnumValues({
  "BNB": Base.BNB,
  "BTC": Base.BTC,
  "ETC": Base.ETC,
  "ETH": Base.ETH,
  "WBTC": Base.WBTC
});

class Market {
  Market({
    this.name,
    this.identifier,
    this.hasTradingIncentive,
  });

  String? name;
  String? identifier;
  bool? hasTradingIncentive;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        name: json["name"],
        identifier: json["identifier"],
        hasTradingIncentive: json["has_trading_incentive"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "identifier": identifier,
        "has_trading_incentive": hasTradingIncentive,
      };
}

enum Target { USDT, USD, BUSD, BTC, GBP, JPY, EUR, USDC }

final targetValues = EnumValues({
  "BTC": Target.BTC,
  "BUSD": Target.BUSD,
  "EUR": Target.EUR,
  "GBP": Target.GBP,
  "JPY": Target.JPY,
  "USD": Target.USD,
  "USDC": Target.USDC,
  "USDT": Target.USDT
});

enum TargetCoinId { TETHER, BINANCE_USD, BITCOIN, USD_COIN }

final targetCoinIdValues = EnumValues({
  "binance-usd": TargetCoinId.BINANCE_USD,
  "bitcoin": TargetCoinId.BITCOIN,
  "tether": TargetCoinId.TETHER,
  "usd-coin": TargetCoinId.USD_COIN
});

enum TrustScore { GREEN }

final trustScoreValues = EnumValues({"green": TrustScore.GREEN});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}

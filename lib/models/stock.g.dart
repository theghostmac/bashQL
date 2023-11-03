// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stock _$StockFromJson(Map<String, dynamic> json) => Stock(
      json['stockId'] as int,
      json['stockName'] as String,
      (json['stockPrice'] as num).toDouble(),
      (json['stockStartingDayPrice'] as num).toDouble(),
      (json['stockEndingDayPrice'] as num).toDouble(),
      json['assetIcon'] as String,
      (json['strategies'] as List<dynamic>)
          .map((e) => StockData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StockToJson(Stock instance) => <String, dynamic>{
      'stockId': instance.stockId,
      'stockName': instance.stockName,
      'stockPrice': instance.stockPrice,
      'stockStartingDayPrice': instance.stockStartingDayPrice,
      'stockEndingDayPrice': instance.stockEndingDayPrice,
      'assetIcon': instance.assetIcon,
      'strategies': instance.strategies,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockData _$StockDataFromJson(Map<String, dynamic> json) => StockData(
      json['feedData'] as String,
      json['strategy'] as String,
      json['stockQuant'] as String,
    );

Map<String, dynamic> _$StockDataToJson(StockData instance) => <String, dynamic>{
      'feedData': instance.feedData,
      'strategy': instance.strategy,
      'stockQuant': instance.stockQuant,
    };

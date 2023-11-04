// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stock_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StockData _$StockDataFromJson(Map<String, dynamic> json) => StockData(
      (json['day'] as num).toDouble(),
      (json['price'] as num).toDouble(),
      json['stockQuant'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$StockDataToJson(StockData instance) => <String, dynamic>{
      'day': instance.day,
      'price': instance.price,
      'stockQuant': instance.stockQuant,
      'description': instance.description,
    };

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

extension PackageModelX on PackageModel {
  String get durationSuffix {
    switch (id) {
      case 'weekly':
        return 'week';
      case 'monthly':
        return 'month';
      case 'yearly':
        return 'year';
      default:
        return 'month';
    }
  }

  double get weeklyPrice {
    switch (id) {
      case 'weekly':
        return price;
      case 'monthly':
        return price / 4; // 1 ay = 4 hafta
      case 'yearly':
        return price / 52; // 1 yıl = 52 hafta
      default:
        return price;
    }
  }

  String get formattedWeeklyPrice {
    final weekPrice = weeklyPrice.toInt();
    return '$weekPrice.99';
  }
}

class PackageModel extends Equatable {
  final String id;
  final String name;
  final String description;
  final double price;
  final double durationInMonths;
  final List<String> features;
  final bool isPopular;

  const PackageModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.durationInMonths,
    required this.features,
    required this.isPopular,
  });

  PackageModel copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    double? durationInMonths,
    List<String>? features,
    bool? isPopular,
  }) {
    return PackageModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      durationInMonths: durationInMonths ?? this.durationInMonths,
      features: features ?? this.features,
      isPopular: isPopular ?? this.isPopular,
    );
  }

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      price: map['price'] as double,
      durationInMonths: map['durationInMonths'] as double,
      features: List<String>.from(map['features']),
      isPopular: map['isPopular'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'durationInMonths': durationInMonths,
      'features': features,
      'isPopular': isPopular,
    };
  }

  factory PackageModel.fromJson(String source) =>
      PackageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [id, name, description, price, durationInMonths, features, isPopular];
}
 
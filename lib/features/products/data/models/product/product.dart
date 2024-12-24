import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'rating.dart';

class Product extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  const Product({
    @required this.id,
    @required this.title,
    @required this.price,
    @required this.description,
    @required this.category,
    @required this.image,
    @required this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        title: json['title'],
        price: (json['price'] is String
                ? double.parse(json['price'])
                : json['price'])
            .toDouble(),
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: Rating.fromJson(json['rating'] ?? {'rate': 0.0, 'count': 0}),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price.toString(),
        'description': description,
        'category': category,
        'image': image,
        // 'rating': rating.toJson(),
      };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      price,
      description,
      category,
      image,
      rating,
    ];
  }
}

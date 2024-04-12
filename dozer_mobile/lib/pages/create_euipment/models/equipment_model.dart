import 'package:equatable/equatable.dart';

class Equipment extends Equatable {
  final String name;
  final int quantity;
  final double pricePerHour;
  final String location;
  final String description;
  final String category;
  final List<String> images;
  final String capacity;
  final String model;
  final String specification;
  final bool transportation;

  Equipment({
    required this.name,
    required this.quantity,
    required this.pricePerHour,
    required this.location,
    required this.description,
    required this.category,
    required this.images,
    required this.capacity,
    required this.model,
    required this.specification,
    required this.transportation,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
      'price_per_hour': pricePerHour,
      'location': location,
      'description': description,
      'category': category,
      'images': images,
      'capacity': capacity,
      'model': model,
      'specification': specification,
      'transportation': transportation,
    };
  }

  @override
  List<Object?> get props => [
        name,
        quantity,
        pricePerHour,
        location,
        description,
        category,
        images,
        capacity,
        model,
        specification,
        transportation,
      ];
}

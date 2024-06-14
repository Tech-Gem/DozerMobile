class BookingModel {
  final String? id; // Nullable id field
  final String? equipmentName; // Nullable equipmentName field
  final String? equipmentPrice; // Nullable equipmentPrice field
  final String? firstName; // Nullable firstName field
  final String? lastName; // Nullable lastName field
  final String? txRef; // Nullable txRef field
  final String? paymentStatus; // Nullable paymentStatus field
  final String? userId; // Nullable userId field
  final String? createdAt; // Nullable createdAt field
  final String? updatedAt; // Nullable updatedAt field

  final String equipmentId;
  final String email;
  final String startDate;
  final String endDate;
  final String location;
  final int quantity;
  final String signature;
  final bool termsAndConditions;

  BookingModel({
    this.id,
    this.equipmentName,
    this.equipmentPrice,
    this.firstName,
    this.lastName,
    this.txRef,
    this.paymentStatus,
    this.userId,
    this.createdAt,
    this.updatedAt,
    required this.equipmentId,
    required this.email,
    required this.startDate,
    required this.endDate,
    required this.location,
    required this.quantity,
    required this.signature,
    required this.termsAndConditions,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      equipmentName: json['equipmentName'],
      equipmentPrice: json['equipmentPrice'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      txRef: json['txRef'],
      paymentStatus: json['paymentStatus'],
      userId: json['userId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      equipmentId: json['equipmentId'],
      email: json['email'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      location: json['location'],
      quantity: json['quantity'],
      signature: json['signature'],
      termsAndConditions: json['termsAndConditions'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'equipmentName': equipmentName,
      'equipmentPrice': equipmentPrice,
      'firstName': firstName,
      'lastName': lastName,
      'txRef': txRef,
      'paymentStatus': paymentStatus,
      'userId': userId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'equipmentId': equipmentId,
      'email': email,
      'startDate': startDate,
      'endDate': endDate,
      'location': location,
      'quantity': quantity,
      'signature': signature,
      'termsAndConditions': termsAndConditions,
    };
  }
}

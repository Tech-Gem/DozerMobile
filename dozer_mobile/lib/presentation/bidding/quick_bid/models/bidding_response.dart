class BidResponse {
  final String id;
  final String status;
  final String roomId;
  final String userName;
  final String title;
  final String description;
  final double priceMin;
  final double priceMax;
  final bool isHost;
  final List<String> participants;
  final String userId;
  final DateTime updatedAt;
  final DateTime createdAt;

  BidResponse({
    required this.id,
    required this.status,
    required this.roomId,
    required this.userName,
    required this.title,
    required this.description,
    required this.priceMin,
    required this.priceMax,
    required this.isHost,
    required this.participants,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
  });

  factory BidResponse.fromJson(Map<String, dynamic> json) {
    return BidResponse(
      id: json['id'],
      status: json['status'],
      roomId: json['roomId'],
      userName: json['userName'],
      title: json['title'],
      description: json['description'],
      priceMin: double.parse(json['priceMin']),
      priceMax: double.parse(json['priceMax']),
      isHost: json['isHost'],
      participants: List<String>.from(json['participants']),
      userId: json['userId'],
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

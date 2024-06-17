class NotificationModel {
  final String id;
  final String message;
  final String type;
  final bool isRead;
  final DateTime timestamp;
  final String userId;

  NotificationModel({
    required this.id,
    required this.message,
    required this.type,
    required this.isRead,
    required this.timestamp,
    required this.userId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      message: json['message'],
      type: json['type'],
      isRead: json['isRead'],
      timestamp: DateTime.parse(json['timestamp']),
      userId: json['userId'],
    );
  }
}

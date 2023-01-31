class NotificationEntity {
  final String id;
  final String title;
  final String? message;
  final DateTime date;

  NotificationEntity({required this.id, required this.title, this.message, required this.date});

  NotificationEntity copy({String? title, String? message, DateTime? date}) {
    return NotificationEntity(
        id: id, title: title ?? this.title, message: message ?? this.message, date: date ?? this.date);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as NotificationEntity).id;
  }
}

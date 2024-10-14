class Booking {
  final int id;
  final int tripId;
  final int userId;
  final int seatsBooked;
  final int amountPaid;
  final DateTime bookingDate;

  Booking({
    required this.id,
    required this.tripId,
    required this.userId,
    required this.seatsBooked,
    required this.amountPaid,
    required this.bookingDate,
  });

  // Factory to create Booking from JSON
  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      tripId: json['tripId'],
      userId: json['userId'],
      seatsBooked: json['seatsBooked'],
      amountPaid: json['amountPaid'],
      bookingDate: DateTime.parse(json['bookingDate']),
    );
  }

  // Convert Booking to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tripId': tripId,
      'userId': userId,
      'seatsBooked': seatsBooked,
      'amountPaid': amountPaid,
      'bookingDate': bookingDate.toIso8601String(),
    };
  }
}

// trip_model.dart
class Trip {
  final int? id;
  final int userId;
  final int busId;
  final String fromLocation;
  final String toLocation;
  final DateTime departureDate;
  final DateTime? arrivalDate;
  final int busCapacity;
  final String contactNumber;
  final int paymentAdvance;
  final int paymentTotal;
  final String bookingStatus;
  final String tripStatus;
  final DateTime bookedDate;

  Trip({
    this.id,
    required this.userId,
    required this.busId,
    required this.fromLocation,
    required this.toLocation,
    required this.departureDate,
    this.arrivalDate,
    required this.busCapacity,
    required this.contactNumber,
    required this.paymentAdvance,
    required this.paymentTotal,
    required this.bookingStatus,
    required this.tripStatus,
    required this.bookedDate,
  });

  // Deserialize JSON to Trip object
  factory Trip.fromJson(Map<String, dynamic> json) {
    return Trip(
      id: json['id'],
      userId: json['userId'],
      busId: json['busId'],
      fromLocation: json['fromLocation'],
      toLocation: json['toLocation'],
      departureDate: DateTime.parse(json['departureDate']),
      arrivalDate: json['arrivalDate'] != null
          ? DateTime.parse(json['arrivalDate'])
          : null,
      busCapacity: json['busCapacity'],
      contactNumber: json['contactNumber'],
      paymentAdvance: json['paymentAdvance'],
      paymentTotal: json['paymentTotal'],
      bookingStatus: json['bookingStatus'],
      tripStatus: json['tripStatus'],
      bookedDate: DateTime.parse(json['bookedDate']),
    );
  }

  // Serialize Trip object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'busId': busId,
      'fromLocation': fromLocation,
      'toLocation': toLocation,
      'departureDate': departureDate.toIso8601String(),
      'arrivalDate': arrivalDate?.toIso8601String(),
      'busCapacity': busCapacity,
      'contactNumber': contactNumber,
      'paymentAdvance': paymentAdvance,
      'paymentTotal': paymentTotal,
      'bookingStatus': bookingStatus,
      'tripStatus': tripStatus,
      'bookedDate': bookedDate.toIso8601String(),
    };
  }
}

class Bus {
  final int id;
  final String busName;
  final int capacity;
  final String plateNumber;

  Bus({
    required this.id,
    required this.busName,
    required this.capacity,
    required this.plateNumber,
  });

  // Factory to create Bus from JSON
  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
      id: json['id'],
      busName: json['bus_name'],
      capacity: json['capacity'],
      plateNumber: json['plate_number'],
    );
  }

  // Convert Bus to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bus_name': busName,
      'capacity': capacity,
      'plate_number': plateNumber,
    };
  }
}

// trip_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testpro/models/trip.dart';

class TripService {
  final String baseUrl =
      'https://vishnureji.net/thadathil-holidays/trip_api.php';

  // Fetch a specific trip by ID
  Future<Trip> fetchTripById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl?id=$id'));

    if (response.statusCode == 200) {
      return Trip.fromJson(json.decode(response.body)); // Convert JSON to Trip
    } else {
      throw Exception('Failed to load trip');
    }
  }

  // Fetch all trips
  Future<List<Trip>> fetchAllTrips() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Trip.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load trips');
    }
  }

  // Insert a new trip
  Future<void> createTrip(Trip trip) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(trip.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to create trip');
    }
  }

  // Update an existing trip
  Future<void> updateTrip(Trip trip) async {
    if (trip.id == null) throw Exception('Trip ID is required for update');

    final response = await http.put(
      Uri.parse('$baseUrl?id=${trip.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(trip.toJson()),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update trip');
    }
  }
}

// trip_detail_page.dart
import 'package:flutter/material.dart';
import 'package:testpro/api/trip_api_service.dart';
import 'package:testpro/models/trip.dart';

class TripDetailPage extends StatelessWidget {
  final int tripId;
  final TripService tripService = TripService(); // Use TripService instance

  TripDetailPage({super.key, required this.tripId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trip Details')),
      body: FutureBuilder<Trip>(
        future: tripService
            .fetchTripById(tripId), // Use TripService to fetch a Trip object
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('Trip not found.'));
          } else {
            final Trip trip = snapshot.data!; // Use the Trip object

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('From: ${trip.fromLocation}',
                      style: TextStyle(fontSize: 18)),
                  Text('To: ${trip.toLocation}',
                      style: TextStyle(fontSize: 18)),
                  Text('Departure: ${trip.departureDate.toLocal()}',
                      style: TextStyle(fontSize: 18)),
                  Text(
                      'Arrival: ${trip.arrivalDate?.toLocal() ?? "Not available"}',
                      style: TextStyle(fontSize: 18)),
                  Text('Contact: ${trip.contactNumber}',
                      style: TextStyle(fontSize: 18)),
                  SizedBox(height: 20),
                  Text('Status: ${trip.tripStatus}',
                      style: TextStyle(fontSize: 18)),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

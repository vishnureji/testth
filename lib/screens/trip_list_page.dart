// trip_list_page.dart
import 'package:flutter/material.dart';
import 'package:testpro/api/trip_api_service.dart';
import 'package:testpro/screens/trip_detail_page.dart';

class TripListPage extends StatelessWidget {
  final TripApiService apiService = TripApiService();

  TripListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('All Trips')),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: apiService.fetchAllTrips(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No trips found.'));
          } else {
            final trips = snapshot.data!;
            return ListView.builder(
              itemCount: trips.length,
              itemBuilder: (context, index) {
                final trip = trips[index];
                return ListTile(
                  title:
                      Text('${trip['fromLocation']} → ${trip['toLocation']}'),
                  subtitle: Text('Departure: ${trip['departureDate']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TripDetailPage(tripId: trip['id']),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

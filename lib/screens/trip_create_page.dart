// trip_create_page.dart
import 'package:flutter/material.dart';
import 'package:testpro/api/trip_api_service.dart';

class TripCreatePage extends StatelessWidget {
  final TripApiService apiService = TripApiService();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController fromLocationController = TextEditingController();
  final TextEditingController toLocationController = TextEditingController();
  final TextEditingController busCapacityController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();

  TripCreatePage({super.key});

  void _createTrip(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final tripData = {
        'userId': 'YaVJ2L4jLUPjvYew0zaswAlpzC42',
        'busId': 1,
        'fromLocation': fromLocationController.text,
        'toLocation': toLocationController.text,
        'departureDate': '2024-10-20',
        'arrivalDate': '2024-10-21',
        'busCapacity': int.parse(busCapacityController.text),
        'contactNumber': contactNumberController.text,
        'paymentAdvance': 500,
        'paymentTotal': 1000,
        'bookingStatus': 'Confirmed',
        'tripStatus': 'Scheduled',
        'bookedDate': '2024-10-14',
      };

      try {
        await apiService.createTrip(tripData);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Trip created successfully')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to create trip: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Trip')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: fromLocationController,
                decoration: const InputDecoration(labelText: 'From Location'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a from location' : null,
              ),
              TextFormField(
                controller: toLocationController,
                decoration: const InputDecoration(labelText: 'To Location'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a to location' : null,
              ),
              TextFormField(
                controller: busCapacityController,
                decoration: const InputDecoration(labelText: 'Bus Capacity'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter the bus capacity' : null,
              ),
              TextFormField(
                controller: contactNumberController,
                decoration: const InputDecoration(labelText: 'Contact Number'),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a contact number' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _createTrip(context),
                child: const Text('Create Trip'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

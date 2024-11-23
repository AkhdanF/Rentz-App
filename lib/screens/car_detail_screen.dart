import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myrentzapp/widgets/car_data.dart';
import 'package:myrentzapp/screens/booking_screen.dart';
import 'package:myrentzapp/screens/home_screen.dart'; // Import HomeScreen
import 'package:intl/intl.dart'; // Import intl package

class CarDetailScreen extends StatelessWidget {
  final Car car; // Use Car from car_data.dart

  const CarDetailScreen({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isAvailable = Random().nextBool(); // Random availability status
    final NumberFormat currencyFormatter = NumberFormat.currency(locale: 'id', symbol: 'Rp');

    return WillPopScope(
      onWillPop: () async {
        _navigateToHomeScreen(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(car.name),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => _navigateToHomeScreen(context),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.background,
                Theme.of(context).colorScheme.surface,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Hero(
                        tag: 'carImage${car.imageUrl}',
                        child: Container(
                          width: double.infinity,
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context).colorScheme.shadow.withOpacity(0.5),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.network(
                              car.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Price: ${currencyFormatter.format(car.rentPerDay)} per 24 Hours',
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Description: ${car.type}',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.onBackground.withOpacity(0.7),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Availability: ${isAvailable ? "Available" : "Not Available"}',
                        style: TextStyle(
                          fontSize: 16,
                          color: isAvailable
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.error,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToBookingScreen(context);
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Book Now',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHomeScreen(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
          (Route<dynamic> route) => false,
    );
  }

  void _navigateToBookingScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingScreen(car: car),
      ),
    );
  }
}

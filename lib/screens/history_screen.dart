import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myrentzapp/widgets/car_data.dart'; // Import CarData if needed
import 'package:myrentzapp/screens/home_screen.dart'; // Import HomeScreen if needed

class HistoryScreen extends StatelessWidget {
  final List<RentalHistory> rentalHistory; // Use RentalHistory as a type

  const HistoryScreen({Key? key, required this.rentalHistory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormatter = DateFormat('yyyy-MM-dd');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rental History'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to HomeScreen
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
                  (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: rentalHistory.length,
        itemBuilder: (context, index) {
          final history = rentalHistory[index];
          return Card(
            elevation: 4.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: Colors.grey.shade300, width: 1.0),
            ),
            child: ListTile(
              leading: Image.network(
                history.carImageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(
                history.carName,
                style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Date: ${dateFormatter.format(DateTime.parse(history.date))}'),
                  Text('Duration: ${history.duration} days'),
                  Text('Total Price: ${history.totalPrice}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
class RentalHistory {
  final String carName;
  final String carImageUrl;
  final String date;
  final int duration;
  final String totalPrice;

  RentalHistory({
    required this.carName,
    required this.carImageUrl,
    required this.date,
    required this.duration,
    required this.totalPrice,
  });
}

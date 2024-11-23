import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import intl package
import 'package:myrentzapp/widgets/car_data.dart';

class BookingScreen extends StatefulWidget {
  final Car car;

  const BookingScreen({Key? key, required this.car}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  late DateTime _startDate;
  late DateTime _endDate;
  late NumberFormat currencyFormatter; // Declare currencyFormatter here

  @override
  void initState() {
    super.initState();
    // Set initial dates (e.g., today and tomorrow)
    _startDate = DateTime.now();
    _endDate = DateTime.now().add(Duration(days: 1));
    currencyFormatter = NumberFormat.currency(locale: 'id', symbol: 'Rp'); // Initialize currencyFormatter
  }

  @override
  Widget build(BuildContext context) {
    bool isAvailable = Random().nextBool(); // Random availability status

    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        backgroundColor: Colors.deepPurple, // Purple app bar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Booking Details for ${widget.car.name}',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildDateSelector('Start Date', _startDate, (date) {
                    setState(() => _startDate = date);
                  }),
                  _buildDateSelector('End Date', _endDate, (date) {
                    setState(() => _endDate = date);
                  }),
                  const SizedBox(height: 30),
                  _buildTotalPrice(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(vertical: 18),
                textStyle: const TextStyle(fontSize: 18),
              ),
              onPressed: () => _confirmBooking(context),
              child: const Text('Confirm Booking', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateSelector(String title, DateTime selectedDate, Function(DateTime) onChanged) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18),
          ),
          TextButton(
            onPressed: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2101),
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: ThemeData.light().copyWith(
                      primaryColor: Colors.deepPurple,
                      hintColor: Colors.deepPurple,
                      colorScheme: ColorScheme.light(primary: Colors.deepPurple),
                      buttonTheme: ButtonThemeData(
                        textTheme: ButtonTextTheme.primary,
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              if (picked != null && picked != selectedDate) {
                onChanged(picked);
              }
            },
            child: Text(
              '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalPrice() {
    // Calculate total price based on selected dates and car rent per day
    int days = _endDate.difference(_startDate).inDays;
    int totalPrice = (days * widget.car.rentPerDay).toInt();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Price:',
            style: const TextStyle(fontSize: 18),
          ),
          Text(
            '${currencyFormatter.format(totalPrice)} for $days days',
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }

  void _confirmBooking(BuildContext context) {
    // Implement booking confirmation logic
    print('Booking confirmed for ${widget.car.name} from $_startDate to $_endDate');
    Navigator.pop(context); // Pop the booking screen
  }
}

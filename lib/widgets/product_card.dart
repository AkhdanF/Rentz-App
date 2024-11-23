import 'package:flutter/material.dart';
import 'package:myrentzapp/widgets/car_data.dart'; // Import Car from car_data.dart
import 'package:intl/intl.dart'; // Import intl package

class ProductCard extends StatelessWidget {
  final Car car; // Change to accept Car object
  final Function()? onTap;

  const ProductCard({
    Key? key,
    required this.car, // Update to require Car object
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NumberFormat currencyFormatter = NumberFormat.currency(locale: 'id', symbol: 'Rp');

    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.grey.shade300, width: 1.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: Image.network(
                    car.imageUrl,
                    width: double.infinity,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10.0,
                  right: 10.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.star, size: 16.0, color: Colors.yellow),
                        const SizedBox(width: 4.0),
                        Text(
                          car.rating.toString(),
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    car.name,
                    style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rent Per Day: ${currencyFormatter.format(car.rentPerDay)}',
                        style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 16.0, color: Colors.deepPurple),
                        onPressed: onTap, // Action to navigate or perform onTap function
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      Chip(
                        label: Text(
                          car.type,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.deepPurple,
                      ),
                      const SizedBox(width: 10.0),
                      Chip(
                        label: Text(
                          '${car.seats} Seats',
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.deepPurple,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

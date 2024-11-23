import 'package:flutter/material.dart';

class PromotionalBanner extends StatelessWidget {
  const PromotionalBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          image: const DecorationImage(
            image: NetworkImage('https://img.freepik.com/free-vector/gradient-wavy-background-with-spheres_23-2149111796.jpg?t=st=1718555082~exp=1718558682~hmac=2921295b66c9f7093165574b1196496cef2b81d1996c6bce8b53dfaecae68141&w=2000'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.black.withOpacity(0.1)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Special Offers!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              const Text(
                'Get the best deals on your favorite cars.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),
              ElevatedButton(
                onPressed: () {
                  // Handle promotion tap
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: const Text('Explore Now'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

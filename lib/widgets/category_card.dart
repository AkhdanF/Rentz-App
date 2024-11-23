import 'package:flutter/material.dart';
import 'package:myrentzapp/widgets/car_data.dart'; // Import Car from car_data.dart

class CategoryCard extends StatelessWidget {
  final List<String> categories;

  const CategoryCard({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: categories.map((category) => _buildCategoryCard(context, category)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String category) {
    return GestureDetector(
      onTap: () {
        // Handle category tap
        _filterCarsByCategory(category, context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Text(
          category,
          style: const TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }

  void _filterCarsByCategory(String category, BuildContext context) {
    // Filter cars based on category
    List<Car> filteredCars = CarData.cars.where((car) => car.type == category).toList();
    print('Cars in $category category: $filteredCars');

    // Example: Navigate to a screen to display filtered cars
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FilteredCarsScreen(filteredCars: filteredCars),
      ),
    );
  }
}

// Example screen to display filtered cars
class FilteredCarsScreen extends StatelessWidget {
  final List<Car> filteredCars;

  const FilteredCarsScreen({Key? key, required this.filteredCars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtered Cars'),
      ),
      body: ListView.builder(
        itemCount: filteredCars.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(filteredCars[index].imageUrl),
            title: Text(filteredCars[index].name),
            subtitle: Text(filteredCars[index].type),
            trailing: Text('\$${filteredCars[index].rentPerDay.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}


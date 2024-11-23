import 'package:flutter/material.dart';
import 'package:myrentzapp/widgets/product_card.dart';
import 'package:myrentzapp/widgets/car_data.dart';
import 'package:myrentzapp/screens/car_detail_screen.dart';
import 'package:myrentzapp/widgets/bottom_nav_bar.dart';
import 'package:myrentzapp/widgets/promotional_banner.dart';
import 'package:myrentzapp/widgets/category_card.dart';
import 'package:myrentzapp/widgets/notification_model.dart';
import 'package:myrentzapp/screens/notification_screen.dart';

import 'history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Car>> futureCars;
  bool isSearchExpanded = false;
  List<NotificationModel> notifications = [
    NotificationModel(
      id: 1,
      title: 'New Notification',
      description: 'You have a new message.',
      isRead: false,
    ),
    NotificationModel(
      id: 2,
      title: 'Reminder',
      description: 'Don\'t forget to complete your profile.',
      isRead: true,
    ),
    NotificationModel(
      id: 3,
      title: 'Offer Alert',
      description: 'Exclusive offers waiting for you!',
      isRead: false,
    ),
  ];

  List<RentalHistory> rentalHistory = [
    RentalHistory(
      carName: 'Toyota Camry',
      carImageUrl: 'https://i.pinimg.com/736x/bb/69/70/bb6970fa48737f011870f75b787e0de0.jpg',
      date: '2023-05-10',
      duration: 3,
      totalPrice: 'Rp6,000,000',
    ),
    RentalHistory(
      carName: 'Honda Civic',
      carImageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKXXWSILsVjO01ZoTthaX3FkRUleemyDLSjw&s',
      date: '2023-06-12',
      duration: 5,
      totalPrice: 'Rp9,000,000',
    ),
  ];

  @override
  void initState() {
    super.initState();
    futureCars = fetchCars();
  }

  Future<List<Car>> fetchCars() async {
    await Future.delayed(const Duration(seconds: 1));
    return CarData.cars;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: !isSearchExpanded
              ? const Text('Rent CarZ')
              : TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                isSearchExpanded = !isSearchExpanded;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(
                    notifications: notifications,
                    markAsRead: (int id) {
                      setState(() {
                        final index = notifications.indexWhere((n) => n.id == id);
                        if (index != -1) {
                          notifications[index].isRead = true;
                        }
                      });
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Car>>(
        future: futureCars,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const PromotionalBanner(),
                const CategoryCard(categories: ['Sedan', 'SUV', 'Luxury', 'Compact']),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        car: snapshot.data![index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarDetailScreen(car: snapshot.data![index]),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching cars: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: 0,
        rentalHistory: rentalHistory,
      ),
    );
  }
}

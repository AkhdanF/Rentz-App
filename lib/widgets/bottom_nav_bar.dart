import 'package:flutter/material.dart';
import 'package:myrentzapp/screens/history_screen.dart';
import 'package:myrentzapp/screens/profile_screen.dart';


class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<RentalHistory> rentalHistory; // Add parameter to pass rental history

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.rentalHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      currentIndex: currentIndex,
      selectedItemColor: Colors.deepPurple,
      onTap: (index) {
        if (index == 2) { // If profile icon is tapped
          _navigateToProfile(context);
        } else if (index == 1) { // If history icon is tapped
          _navigateToHistory(context);
        }
      },
    );
  }

  void _navigateToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  }

  void _navigateToHistory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HistoryScreen(rentalHistory: rentalHistory)),
    );
  }
}

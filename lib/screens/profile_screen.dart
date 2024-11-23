import 'package:flutter/material.dart';
import 'package:myrentzapp/screens/welcome_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  // Function to handle sign-out
  void _signOut(BuildContext context) {
    // Implement your sign-out logic here, such as clearing authentication tokens, resetting states, etc.
    // For example, navigate back to the WelcomeScreen after sign-out
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
          (Route<dynamic> route) => false, // Clear all routes from the stack
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white, // Set the color to white
          ),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: const NetworkImage('https://via.placeholder.com/150'),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Akhdan Farros',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Email: akhdan.arvin@gmail.com',
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  'Phone: +62 81290005513',
                  style: const TextStyle(fontSize: 18, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 30),
              ListTile(
                leading: Icon(Icons.account_circle, color: Colors.deepPurple),
                title: Text('Account Settings'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to Account Settings screen
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications, color: Colors.deepPurple),
                title: Text('Notification Settings'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to Notification Settings screen
                },
              ),
              ListTile(
                leading: Icon(Icons.lock, color: Colors.deepPurple),
                title: Text('Privacy Policy'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to Privacy Policy screen
                },
              ),
              ListTile(
                leading: Icon(Icons.help, color: Colors.deepPurple),
                title: Text('Help & Support'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Navigate to Help & Support screen
                },
              ),
              const SizedBox(height: 30),

              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _signOut(context); // Call the sign-out function
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.white,
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
}

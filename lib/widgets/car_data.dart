// Import intl package
import 'package:intl/intl.dart'; // Import intl package

class CarData {
  static List<Car> cars = [
    Car(
      name: 'Toyota Camry',
      rentPerDay: 2000000.0,
      type: 'Sedan',
      imageUrl: 'https://i.pinimg.com/736x/bb/69/70/bb6970fa48737f011870f75b787e0de0.jpg',
      seats: 5,
      rating: 4.5,
    ),
    Car(
      name: 'Honda Civic',
      rentPerDay: 1800000.0,
      type: 'Sedan',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKXXWSILsVjO01ZoTthaX3FkRUleemyDLSjw&s',
      seats: 5,
      rating: 4.3,
    ),
    Car(
      name: 'Ford F150',
      rentPerDay: 2500000.0,
      type: 'Pickup Truck',
      imageUrl: 'https://w7.pngwing.com/pngs/432/561/png-transparent-2018-ford-f-150-lariat-car-thames-trader-pickup-truck-ford-f150-truck-automatic-transmission-transport.png',
      seats: 6,
      rating: 4.7,
    ),
    Car(
      name: 'BMW X5',
      rentPerDay: 3000000.0,
      type: 'SUV',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRf8DbqZcb1_PG7_Hee_Dgh-OyfMkUGajUICw&s',
      seats: 7,
      rating: 4.8,
    ),
    Car(
      name: 'Audi A4',
      rentPerDay: 2800000.0,
      type: 'Sedan',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQotUWmuga5fiuvuNg15DyW7L9-1-NlFBm-dQ&s',
      seats: 5,
      rating: 4.4,
    ),
    Car(
      name: 'Tesla Model S',
      rentPerDay: 4000000.0,
      type: 'Electric',
      imageUrl: 'https://c0.klipartz.com/pngpicture/815/449/gratis-png-2016-tesla-model-s-tesla-motors-tesla-model-x-car-tesla.png',
      seats: 5,
      rating: 4.9,
    ),
  ];
}


class Car {
  final String name;
  final String imageUrl;
  final double rentPerDay;
  final String type;
  final int seats; // Added seats property
  final double rating; // Added rating property

  Car({
    required this.name,
    required this.imageUrl,
    required this.rentPerDay,
    required this.type,
    required this.seats,
    required this.rating,
  });
}

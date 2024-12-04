import 'package:flutter/material.dart';
import 'views/login_screen.dart'; // Path ke file LoginScreen
import 'views/movie_screen.dart'; // Path ke file MovieScreen
import 'views/splash_screen.dart'; // Path ke file SplashScreen
import 'views/cinema_screen.dart'; // Path ke file CinemaScreen
import 'views/dashboard_screen.dart'; // Path ke file DashboardScreen
import 'views/my_booking_screen.dart'; // Path ke file MyBookingScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cinepolis",
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 5, 29, 48), // Warna utama aplikasi
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(), 
        '/login': (context) => LoginScreen(), 
        '/dashboard': (context) => DashboardScreen(), 
        '/my_booking': (context) => MyBookingScreen(), 
        '/movie': (context) => MovieScreen(), 
        '/cinema': (context) => CinemaScreen(), 
      },
    );
  }
}


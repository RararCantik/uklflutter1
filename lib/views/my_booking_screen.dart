import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/movie_screen.dart';
import 'package:flutter_application_1/views/cinema_screen.dart';
import 'package:flutter_application_1/views/dashboard_screen.dart';

class MyBookingScreen extends StatefulWidget {
  @override
  State<MyBookingScreen> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBookingScreen> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "My Booking",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "There's no active booking!",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            BookingCard(
              imageUrl: 'ariana.jpg', // Tambahkan gambar ke folder assets
              title: 'WICKED',
              rating: '9.5',
              category: 'Musikal,Adventure,Romance',
              ageRestriction: 'D 8+',
            ),
            const SizedBox(height: 30),
            BookingCard(
              imageUrl: '6.jpg', // Tambahkan gambar ke folder assets
              title: 'COCO',
              rating: '9.3',
              category: 'Romance, Adventure',
              ageRestriction: 'R 8+',
            ),
            const SizedBox(height: 30),
            BookingCard(
              imageUrl: 'encanto.jpeg', // Tambahkan gambar ke folder assets
              title: 'ENCANTO',
              rating: '8.5',
              category: 'Romance, Adventure',
              ageRestriction: 'R 12+',
            ),
            const SizedBox(height: 30),
            BookingCard(
              imageUrl: 'littlemermaid.jpeg', // Tambahkan gambar ke folder assets
              title: 'LITTLE MERMAID',
              rating: '8.6',
              category: 'Adventure,Princess',
              ageRestriction: 'R 17+',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            const Color(0xFF0E1D54), // Warna biru gelap untuk latar
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num_outlined),
            label: "My Booking",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Movie",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            label: "Cinema",
          ),
        ],
        currentIndex: _selectedIndex, // Indeks tombol yang sedang dipilih
        selectedItemColor:
            const Color(0xFF3E96DE), // Warna biru terang untuk ikon terpilih
        unselectedItemColor:
            Colors.white, // Warna putih untuk ikon tidak terpilih
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Perbarui indeks tombol yang dipilih
          });

          // Navigasi ke halaman berdasarkan indeks
          switch (_selectedIndex) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DashboardScreen()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyBookingScreen()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MovieScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CinemaScreen()),
              );
              break;
          }
        },
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String rating;
  final String category;
  final String ageRestriction;

  const BookingCard({
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.category,
    required this.ageRestriction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ageRestriction,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      category,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      rating,
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
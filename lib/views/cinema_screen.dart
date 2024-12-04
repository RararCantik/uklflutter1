import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/movie_screen.dart';
import 'package:flutter_application_1/views/dashboard_screen.dart';
import 'package:flutter_application_1/views/my_booking_screen.dart';

class CinemaScreen extends StatefulWidget {
  const CinemaScreen({Key? key}) : super(key: key);

  @override
  _CinemaScreenState createState() => _CinemaScreenState();
}

class _CinemaScreenState extends State<CinemaScreen> {
  int _selectedIndex = 3; // Indeks yang dipilih adalah Cinema
  String? selectedCity = 'Malang'; // Nilai awal dropdown
  List<Map<String, dynamic>> cinemas = [
    {
      'name': 'Malang Town Square',
      'distance': '8.03 km away',
      'type': 'REGULAR®LUXE',
    },
    {
      'name': 'Lippo Plaza Batu',
      'distance': '11.23 km away',
      'type': 'REGULAR',
    },
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigasi berdasarkan indeks
    switch (index) {
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
        // Tetap di Cinema Screen
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Input Fields
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: selectedCity,
                        items: ['Malang', 'Bandung', 'Yogyakarta', 'Blitar']
                            .map((city) => DropdownMenuItem(
                                  value: city,
                                  child: Text(city),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedCity = value!;
                          });
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.location_on),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cinema / Movie',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ],
            ),
          ),

          // Tabs for Cinema and Movie
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MovieScreen()),
                  );
                },
                child: Column(
                  children: [
                    Text(
                      'Movie',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 50,
                      child: const Divider(
                        color: Colors.transparent,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 50),
              GestureDetector(
                onTap: () {
                  // Tetap di Cinema Screen
                },
                child: Column(
                  children: [
                    Text(
                      'Cinema',
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: 70,
                      child: const Divider(
                        color: Colors.lightBlue,
                        thickness: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Cinema cards display
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: cinemas.length,
              itemBuilder: (context, index) {
                final cinema = cinemas[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(cinema['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cinema['distance']),
                        Text(
                          cinema['type'],
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    leading: const Icon(Icons.location_city),
                  ),
                );
              },
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0E1D54),
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
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF3E96DE),
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        onTap: _onNavBarTapped,
      ),
    );
  }
}

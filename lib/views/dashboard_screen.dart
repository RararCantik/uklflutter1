import 'package:flutter/material.dart'; 
import 'package:flutter_application_1/views/movie_screen.dart';
import 'package:flutter_application_1/views/cinema_screen.dart';
import 'package:flutter_application_1/views/my_booking_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0; // Variabel untuk melacak tombol yang dipilih

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const DashboardPage({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0E1D54),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: 'Malang',
              items:
                  <String>['Malang', 'Jakarta', 'Surabaya'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: const TextStyle(color: Colors.white)),
                );
              }).toList(),
              onChanged: (_) {},
              dropdownColor: const Color.fromRGBO(65, 141, 203, 1),
              underline: Container(),
              icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
            ),
            Row(
              children: const [
                Icon(Icons.favorite_border, color: Colors.white),
                SizedBox(width: 15),
                Icon(Icons.notifications_outlined, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Hello, ",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Text(
                      "Guest !",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ],
              ),
              const Text(
                "Kamu mau nonton apa hari ini?",
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 109, 109, 109)),
              ),
              const SizedBox(height: 20),
              Container(
                height: 220,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    bannerCard('barbie.jpg'),
                    bannerCard('satu.jpg'),
                    bannerCard('avatarpanjang.jpg'),
                    bannerCard('lion.jpg'),
                    bannerCard('tiga.jpg')
                  ],
                ),
              ),
              const SizedBox(height: 20),
              sectionTitle("Now Showing", () {}),
              const SizedBox(height: 10),
              movieList([
                'ariana.jpg',
                '1.jpg',
                '2.jpg',
                '3.jpg',
                '4.jpg',
                '5.jpg',
                '6.jpg',
                '13.jpg',
                '14.webp',
                'littlemermaid.jpeg',
                'wish.jpeg',
                'encanto.jpeg',
                'heroes.jpg',
                'batman.jpg',
                'lion.jpg',
                '7.jpg',
                '9.jpg',
                '8.jpg',
                '10.jpg',
                '11.jpg',
                '12.jpeg',
                '15.jpeg'
              ]),
              const SizedBox(height: 20),
              sectionTitle("Upcoming", () {}),
              const SizedBox(height: 10),
              Container(
                height: 500,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    bannerCard('pelmen.jpg'),
                    bannerCard('peri.jpg'),
                    bannerCard('swan.jpg'),
                    bannerCard('kecil.jpg'),
                    bannerCard('kepalalove.jpg'),
                    
                  ],
                ),
              ),
              const SizedBox(height: 20),
              sectionTitle("Promotion", () {}),
              const SizedBox(height: 15),
              promoCard('p1.jpg'),
              const SizedBox(height: 15),
              promoCard('p4.jpg'),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF0E1D54), // Warna biru gelap
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
        currentIndex: selectedIndex, // Indeks tombol yang sedang dipilih
        selectedItemColor: const Color(0xFF3E96DE), // Warna biru terang
        unselectedItemColor: Colors.white, // Warna putih untuk tombol tidak dipilih
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
        ),
        onTap: (index) {
          onItemSelected(index);

          // Navigasi ke halaman yang sesuai
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBookingScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MovieScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CinemaScreen()),
            );
          }
        },
      ),
    );
  }

  Widget sectionTitle(String title, VoidCallback onSeeAllPressed) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onSeeAllPressed,
          child: const Text(
            "See All",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
  }

  Widget movieList(List<String> imagePaths) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                imagePaths[index],
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget bannerCard(String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          imagePath,
          width: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget promoCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
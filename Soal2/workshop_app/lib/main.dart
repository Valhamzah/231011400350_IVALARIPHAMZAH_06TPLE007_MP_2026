import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
  {
    "judul": "Flutter Dasar",
    "tanggal": "9 Mei 2026",
    "lokasi": "Lab Komputer LT. 9",
    "kuota": "100/120",
    "icon": Icons.code, 
  },
  {
    "judul": "UI/UX Design",
    "tanggal": "11 Mei 2026",
    "lokasi": "Lab Komputer LT. 6",
    "kuota": "50/80",
    "icon": Icons.design_services, 
  },
  {
    "judul": "Public Speaking",
    "tanggal": "14 Mei 2026",
    "lokasi": "Ruang Seminar",
    "kuota": "80/90",
    "icon": Icons.mic, 
  },
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workshop Kampus"),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.notifications),
          SizedBox(width: 10),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
      type: BottomNavigationBarType.fixed, 
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,

      showUnselectedLabels: true, 

      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Beranda",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: "Jadwal",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: "Saya",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: "Profil",
        ),
      ],
    ),

      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: "Cari workshop...",
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),

          SizedBox(height: 20),

          Text(
            "Workshop Terdekat",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          SizedBox(height: 10),

          ...data.map((item) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Gambar / Icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(item["icon"], size: 40),
                    ),

                    SizedBox(width: 12),

                    // Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item["judul"]!,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),

                          SizedBox(height: 6),

                          Row(
                            children: [
                              Icon(Icons.calendar_today, size: 14),
                              SizedBox(width: 4),
                              Text(item["tanggal"]!),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(Icons.location_on, size: 14),
                              SizedBox(width: 4),
                              Text(item["lokasi"]!),
                            ],
                          ),

                          Row(
                            children: [
                              Icon(Icons.people, size: 14),
                              SizedBox(width: 4),
                              Text("Kuota ${item["kuota"]}"),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Tombol
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Daftar"),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
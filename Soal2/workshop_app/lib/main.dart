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

  final List<Map<String, dynamic>> workshop = [
    {
      "judul": "Flutter Dasar",
      "tanggal": "9 Mei 2026",
      "lokasi": "Lab Komputer Lt. 9",
      "kuota": "100/120",
      "icon": Icons.code,
      "warna": Colors.lightBlue[100],
    },
    {
      "judul": "UI/UX Design",
      "tanggal": "11 Mei 2026",
      "lokasi": "Lab Komputer Lt. 6",
      "kuota": "50/80",
      "icon": Icons.phone_android,
      "warna": Colors.green[200],
    },
    {
      "judul": "Public Speaking",
      "tanggal": "14 Mei 2026",
      "lokasi": "Ruang Seminar",
      "kuota": "80/90",
      "icon": Icons.mic_none,
      "warna": Colors.yellow[200],
    },
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      // APPBAR
      appBar: AppBar(
        backgroundColor: Color(0xff9CC7FF),
        elevation: 0,
        titleSpacing: 20,

        title: Text(
          "Workshop App",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18),
            child: Icon(
              Icons.settings_outlined,
              color: Colors.black,
              size: 30,
            ),
          ),
        ],
      ),

      // BODY
      body: Padding(
        padding: EdgeInsets.all(18),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Daftar Workshop",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: workshop.length,

                itemBuilder: (context, index) {

                  final item = workshop[index];

                  return GestureDetector(

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => DetailPage(data: item),
                        ),
                      );
                    },

                    child: Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.grey.shade400,
                          width: 2,
                        ),
                      ),

                      child: Row(
                        children: [

                          // ICON BOX
                          Container(
                            width: 95,
                            height: 95,

                            decoration: BoxDecoration(
                              color: item["warna"],
                              borderRadius: BorderRadius.circular(18),
                            ),

                            child: Icon(
                              item["icon"],
                              size: 50,
                              color: Colors.black,
                            ),
                          ),

                          SizedBox(width: 18),

                          // TEXT
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [

                                Text(
                                  item["judul"],
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                SizedBox(height: 8),

                                Text(
                                  item["tanggal"],
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),

                                SizedBox(height: 5),

                                Text(
                                  item["lokasi"],
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // PANAH
                          Icon(
                            Icons.chevron_right,
                            size: 35,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      // BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,

        showUnselectedLabels: true,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: "Favorit",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: "Jadwal",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profil",
          ),
        ],
      ),
    );
  }
}

// ================= DETAIL PAGE =================

class DetailPage extends StatelessWidget {

  final Map<String, dynamic> data;

  DetailPage({required this.data});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Color(0xff9CC7FF),
        elevation: 0,

        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),

          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: Text(
          "Detail Workshop",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),

            child: Icon(
              Icons.share_outlined,
              color: Colors.black,
              size: 28,
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [

            // CONTENT
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20),

                  child: Column(
                    children: [

                      SizedBox(height: 10),

                      // ICON
                      Container(
                        width: 130,
                        height: 130,

                        decoration: BoxDecoration(
                          color: data["warna"],
                          borderRadius: BorderRadius.circular(25),
                        ),

                        child: Icon(
                          data["icon"],
                          size: 75,
                          color: Colors.black,
                        ),
                      ),

                      SizedBox(height: 20),

                      Text(
                        data["judul"],
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      SizedBox(height: 25),

                      // CARD DETAIL
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(18),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),

                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 2,
                          ),
                        ),

                        child: Column(
                          children: [

                            detailItem(
                              Icons.calendar_today_outlined,
                              "Tanggal",
                              data["tanggal"],
                            ),

                            Divider(height: 30),

                            detailItem(
                              Icons.location_on_outlined,
                              "Lokasi",
                              data["lokasi"],
                            ),

                            Divider(height: 30),

                            detailItem(
                              Icons.people_outline,
                              "Kuota",
                              data["kuota"],
                            ),

                            Divider(height: 30),

                            Row(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,

                              children: [

                                Icon(
                                  Icons.description_outlined,
                                  size: 28,
                                ),

                                SizedBox(width: 15),

                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,

                                    children: [

                                      Text(
                                        "Deskripsi",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight:
                                              FontWeight.w500,
                                        ),
                                      ),

                                      SizedBox(height: 10),

                                      Text(
                                        "Workshop ini membahas dasar-dasar Flutter untuk pemula.",
                                        style: TextStyle(
                                          fontSize: 16,
                                          height: 1.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // BUTTON
            Padding(
              padding: EdgeInsets.all(20),

              child: SizedBox(
                width: double.infinity,
                height: 58,

                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff9CC7FF),
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  onPressed: () {},

                  child: Text(
                    "Daftar Sekarang",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget detailItem(
    IconData icon,
    String title,
    String value,
  ) {

    return Row(
      children: [

        Icon(icon, size: 28),

        SizedBox(width: 15),

        Text(
          title,
          style: TextStyle(
            fontSize: 18,
          ),
        ),

        Spacer(),

        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
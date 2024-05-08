import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoes',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(title: 'Shoes'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(title),
            Spacer(), // Spacer untuk menjaga jarak
            CircleAvatar(
              radius: 20, // Ukuran radius avatar
              backgroundColor: Colors.grey[300], // Warna latar belakang avatar
              child: Icon(
                Icons.person,
                color: Colors.black, // Warna ikon avatar
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ShoeCard(
            imageUrl: 'nikeblue.png',
            shoeName: 'Nike blue',
            shoePrice: 'US \$8.795',
            backgroundColor: const Color.fromARGB(255, 176, 133, 39).withOpacity(0.2), // Background ungu lembut
          ),
          ShoeCard(
            imageUrl: 'nikebrown.png',
            shoeName: 'Nike Cokelat',
            shoePrice: 'US \$9.999',
            backgroundColor: Color.fromARGB(255, 110, 240, 84).withOpacity(0.2), // Background cokelat lembut
          ),
        ],
      ),
    );
  }
}

class ShoeCard extends StatelessWidget {
  final String imageUrl;
  final String shoeName;
  final String shoePrice;
  final Color backgroundColor;

  const ShoeCard({
    required this.imageUrl,
    required this.shoeName,
    required this.shoePrice,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // Column 1: Name and price
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shoeName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    shoePrice,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Warna teks putih
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16.0), // Spacer
            // Column 2: Image
            Container(
              width: 100,
              height: 100,
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(MangacapApp());
}

class MangacapApp extends StatelessWidget {
  const MangacapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mangacap',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChapterPage(),
    );
  }
}

class ChapterPage extends StatelessWidget {
  const ChapterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/img/OIG4.jpeg', height: 40), // Logo de Mangacap
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Frieren',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Capítulo 1.00',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  'Sentido de lectura: De derecha a izquierda',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                   Image.asset('assets/img/0.jpg'), // Imagen 0
                  Image.asset('assets/img/x1.jpg'), // Imagen 1
                  Image.asset('assets/img/x2.jpg'), // Imagen 2
                  Image.asset('assets/img/x3.jpg'), // Imagen 3
                  Image.asset('assets/img/x4.jpg'), // Imagen 4
                  Image.asset('assets/img/x5.jpg'), // Imagen 5
                  Image.asset('assets/img/x6.jpg'), // Imagen 6
                  Image.asset('assets/img/x7.jpg'), // Imagen 7
                  Image.asset('assets/img/x8.jpg'), // Imagen 8
                  Image.asset('assets/img/x9.jpg'), // Imagen 9
                  Image.asset('assets/img/x10.jpg'), // Imagen 10
                  Image.asset('assets/img/x11.jpg'), // Imagen 11
                  Image.asset('assets/img/x12.jpg'), // Imagen 12
                  Image.asset('assets/img/x13.jpg'), // Imagen 13
                  Image.asset('assets/img/x14.jpg'), // Imagen 14
                  Image.asset('assets/img/x15.jpg'), // Imagen 15
                  Image.asset('assets/img/x16.jpg'), // Imagen 16
                  Image.asset('assets/img/x17.jpg'), // Imagen 17
                  Image.asset('assets/img/x18.jpg'), // Imagen 18
                  Image.asset('assets/img/x19.jpg'), // Imagen 19
                  Image.asset('assets/img/x20.jpg'), // Imagen 20
                  Image.asset('assets/img/x21.jpg'), // Imagen 21
                  Image.asset('assets/img/x22.jpg'), // Imagen 22
                  Image.asset('assets/img/x23.jpg'), // Imagen 23
                  Image.asset('assets/img/x24.jpg'), // Imagen 24
                  Image.asset('assets/img/x25.jpg'), // Imagen 25
                  Image.asset('assets/img/x26.jpg'), // Imagen 26
                  Image.asset('assets/img/x27.jpg'), // Imagen 27
                  Image.asset('assets/img/x28.jpg'), // Imagen 28
                  Image.asset('assets/img/x29.jpg'), // Imagen 29
                  Image.asset('assets/img/x30.jpg'), // Imagen 30
                  Image.asset('assets/img/x31.jpg'), // Imagen 31
                  Image.asset('assets/img/x32.jpg'), // Imagen 32
                  Image.asset('assets/img/x33.jpg'), // Imagen 33
                  Image.asset('assets/img/x34.jpg'), // Imagen 34
                  Image.asset('assets/img/x35.jpg'), // Imagen 35
                ],
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Capítulo Anterior'),
                ),
                ElevatedButton(
                  onPressed: () {
                  },
                  child: Text('Capítulo Siguiente'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
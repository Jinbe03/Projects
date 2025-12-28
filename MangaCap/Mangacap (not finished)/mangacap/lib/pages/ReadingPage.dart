import 'package:flutter/material.dart';
import 'capitulo1.dart';

class ReadingPage extends StatelessWidget {
  final String image;
  final String title;

  const ReadingPage({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mangacap'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        'assets/img/91UON3AMZwL._AC_UF1000,1000_QL80_.jpg', 
                        fit: BoxFit.cover,
                        width: 150, 
                        height: 200,
                      ),
                    ),
                  ),
                  // Información del manga
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF220233),
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Autor: Kanehito Yamada',
                            style: TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Género: Fantasía, Aventura, Drama',
                            style: TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                          SizedBox(height: 8.0),
                          Text(
                            'Estado: En emisión',
                            style: TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Frieren: Beyond Journey\'s End es un manga de fantasía y aventura que narra la historia de Frieren, una elfa maga que participó en la derrota del Rey Demonio junto a un grupo de héroes. Sin embargo, tras la muerte de sus compañeros, Frieren se embarca en un viaje solitario para comprender mejor las emociones humanas y el paso del tiempo.',
                style: TextStyle(fontSize: 16.0, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Capítulos',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF220233),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  _buildChapterItem('Capítulo 1', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChapterItem(String chapterTitle, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(Icons.book, color: Colors.blue),
          SizedBox(width: 8.0),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChapterPage()), 
              );
            },
            child: Text(
              chapterTitle,
              style: TextStyle(fontSize: 16.0, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}

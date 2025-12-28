import 'package:flutter/material.dart';
import 'ReadingPage.dart';  

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'En Tendencia',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF220233),
            ),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildMangaItem(
                    'Jujutsu Kaisen', 
                    'assets/img/Jujutsu_Kaisen_Manga_Volumen_26_JP.webp',
                    false,  
                    context
                  ),
                  _buildMangaItem(
                    'Frieren: Beyond Journey\'s End', 
                    'assets/img/91UON3AMZwL._AC_UF1000,1000_QL80_.jpg', 
                    true,  
                    context
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMangaItem(String title, String imagePath, bool shouldRedirect, BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          shouldRedirect
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReadingPage(
                          image: imagePath,
                          title: title,
                        ),
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 250,
                    ),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 250,
                  ),
                ),
          SizedBox(height: 8.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF220233),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'ReadingPage.dart'; 
class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  String selectedGenre = "Todos";
  List<Map<String, String>> mangas = [
    {
      "name": "Jujutsu Kaisen",
      "image": "assets/img/Jujutsu_Kaisen_Manga_Volumen_26_JP.webp",
      "genres": "acción,aventura,shounen"
    },
    {
      "name": "Frieren: Beyond Journey's End",
      "image": "assets/img/91UON3AMZwL._AC_UF1000,1000_QL80_.jpg",
      "genres": "fantasía,drama,aventura"
    },
    {
      "name": "Dan Da Dan",
      "image": "assets/img/c7f830c7735b26e79e18f65cdafeca9f37e84e6a.jpeg",
      "genres": "acción,sobrenatural,comedia"
    },
    {
      "name": "Blue Exorcist",
      "image": "assets/img/ao-no-exorcist-vol31-blue-exorcist.jpg",
      "genres": "acción,aventura,sobrenatural"
    },
    {
      "name": "Misión: Familia Yozakura",
      "image": "assets/img/D_NQ_NP_757889-MLC51658608206_092022-O.webp",
      "genres": "comedia,acción,shounen"
    },
  ];

  void filterByGenre(String genre) {
    setState(() {
      selectedGenre = genre;
    });
  }

  void showAllMangas() {
    setState(() {
      selectedGenre = "Todos";
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredMangas = selectedGenre == "Todos"
        ? mangas
        : mangas
            .where((manga) => manga["genres"]!
                .toLowerCase()
                .contains(selectedGenre.toLowerCase()))
            .toList();

    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            // Menú de géneros
            Container(
              width: MediaQuery.of(context).size.width *
                  0.3, // Uso de 30% de la pantalla
              padding: EdgeInsets.all(16),
              color: Color(0xFF220233),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Géneros',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  ListView(
                    shrinkWrap: true,
                    children: [
                      'Acción',
                      'Aventura',
                      'Comedia',
                      'Drama',
                      'Fantasía',
                      'Horror',
                      'Romance',
                      'Ciencia Ficción'
                    ].map((genre) {
                      return GestureDetector(
                        onTap: () => filterByGenre(genre),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            genre,
                            style: TextStyle(
                              color: selectedGenre == genre
                                  ? Color(0xFFDB83F4)
                                  : Colors.white,
                              fontWeight: selectedGenre == genre
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ),
                      );
                    }).toList()
                      ..add(
                        GestureDetector(
                          onTap: showAllMangas,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Ver Todos',
                              style: TextStyle(
                                color: selectedGenre == "Todos"
                                    ? Color(0xFFDB83F4)
                                    : Colors.white,
                                fontWeight: selectedGenre == "Todos"
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ),
                ],
              ),
            ),

            // Lista de mangas filtrados
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Género seleccionado: $selectedGenre',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            200, // Controla el tamaño de las imágenes
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: filteredMangas.length,
                      itemBuilder: (context, index) {
                        final manga = filteredMangas[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReadingPage(
                                  image: manga["image"]!,
                                  title: manga["name"]!,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  manga["image"]!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 150,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                manga["name"]!,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

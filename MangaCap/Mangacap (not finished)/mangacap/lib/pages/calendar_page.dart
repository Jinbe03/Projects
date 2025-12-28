import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int _currentMonth = DateTime.now().month;
  int _currentYear = DateTime.now().year;

  final Map<int, Map<String, String>> _imagesPerDay = {
    0: {'image': 'assets/img/Volumen_37.webp', 'title': 'My Hero Academia'},
    1: {'image': 'assets/img/Volumen_12_Portada.webp', 'title': 'Spy x Family'},
    2: {'image': 'assets/img/blue-lock.webp', 'title': 'Blue Lock'},
    3: {'image': 'assets/img/Jujutsu_Kaisen_Manga_Volumen_26_JP.webp', 'title': 'Jujutsu Kaisen'},
    4: {'image': 'assets/img/91UON3AMZwL._AC_UF1000,1000_QL80_.jpg', 'title': 'Frieren: Beyond Journey\'s End'},
    5: {'image': 'assets/img/ao-no-exorcist-vol31-blue-exorcist.jpg', 'title': 'Blue Exorcist'},
    6: {'image': 'assets/img/portada-volumen-31-tokyo-revengers.webp', 'title': 'Tokyo Revengers'},
  };

  List<Widget> _buildDays(int month, int year) {
    final List<Widget> days = [];
    final int firstDay = DateTime(year, month, 1).weekday % 7;
    final int totalDays = DateTime(year, month + 1, 0).day;

    for (int i = 0; i < firstDay; i++) {
      days.add(Container());
    }

    for (int day = 1; day <= totalDays; day++) {
      int weekDay = DateTime(year, month, day).weekday % 7;
      days.add(GestureDetector(
        onTap: () => _showImageModal(weekDay),
        child: Container(
          margin: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8.0),
          ),
          alignment: Alignment.center,
          child: Text(
            '$day',
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ));
    }
    return days;
  }

  void _changeMonth(int increment) {
    setState(() {
      _currentMonth += increment;
      if (_currentMonth < 1) {
        _currentMonth = 12;
        _currentYear--;
      } else if (_currentMonth > 12) {
        _currentMonth = 1;
        _currentYear++;
      }
    });
  }

  void _showImageModal(int weekDay) {
    final imageInfo = _imagesPerDay[weekDay];
    if (imageInfo != null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(imageInfo['title']!),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  imageInfo['image']!,
                  width: 200.0,  
                  height: 300.0,
                  fit: BoxFit.cover, 
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cerrar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendario de Emisión'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => _changeMonth(-1),
                icon: const Icon(Icons.arrow_left),
              ),
              Text(
                DateFormat('MMMM yyyy', 'es_ES')
                    .format(DateTime(_currentYear, _currentMonth)),
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () => _changeMonth(1),
                icon: const Icon(Icons.arrow_right),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text('L', style: TextStyle(fontSize: 16)),
              Text('M', style: TextStyle(fontSize: 16)),
              Text('M', style: TextStyle(fontSize: 16)),
              Text('J', style: TextStyle(fontSize: 16)),
              Text('V', style: TextStyle(fontSize: 16)),
              Text('S', style: TextStyle(fontSize: 16)),
              Text('D', style: TextStyle(fontSize: 16)),
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 7, 
              children: _buildDays(_currentMonth, _currentYear),
            ),
          ),
        ],
      ),
    );
  }
}

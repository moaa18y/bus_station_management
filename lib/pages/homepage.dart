import 'package:flutter/material.dart';
import 'package:tt/pages/home_buttom_nav.dart';
import 'package:tt/pages/more_buttom_nav.dart';
import 'package:tt/pages/tickets_buttom_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home_Main(),
    Tickets_Main(),
    More_Main(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF00ADCF),
        onTap: _onItemTapped,
      ),
    );
  }
}

class Home_Main extends StatelessWidget {
  const Home_Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Home(),
    );
  }
}

class Tickets_Main extends StatelessWidget {
  const Tickets_Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TicketsPage(),
    );
  }
}

class More_Main extends StatelessWidget {
  const More_Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MorePage(),
    );
  }
}

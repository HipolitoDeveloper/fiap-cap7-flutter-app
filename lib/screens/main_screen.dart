import 'package:flutter/material.dart';
import '../models/travel.dart';
import 'home_page.dart';
import 'travels_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Variável para controlar o índice da aba selecionada
  final List<Travel> travels = []; // Lista para armazenar as viagens

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Atualiza o índice quando uma aba é selecionada
    });
  }

  void _addTravel(Travel travel) {
    setState(() {
      travels.add(travel); // Adiciona uma nova viagem e atualiza a UI
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0
          ? HomePage(onCreateTravel: _addTravel) // Página inicial
          : TravelsPage(travels: travels), // Página de viagens
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_bus),
            label: 'Travels',
          ),
        ],
        currentIndex: _selectedIndex, // Índice da aba selecionada
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped, // Chama o método quando uma aba é tocada
      ),
    );
  }
}

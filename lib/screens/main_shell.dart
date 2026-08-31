import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'sensors_screen.dart';
import 'device_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SensorsScreen(),
    const DeviceScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    if (isMobile) {
      return Scaffold(
        appBar: AppBar(title: const Text('Dispositivo Responsivo')),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Inicio'),
            BottomNavigationBarItem(icon: Icon(Icons.sensors), label: 'Sensores'),
            BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Dispositivo'),
          ],
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('Dispositivo Responsivo')),
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: _selectedIndex,
              onDestinationSelected: (index) => setState(() => _selectedIndex = index),
              destinations: const [
                NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Inicio')),
                NavigationRailDestination(icon: Icon(Icons.sensors), label: Text('Sensores')),
                NavigationRailDestination(icon: Icon(Icons.info), label: Text('Dispositivo')),
              ],
            ),
            Expanded(child: _screens[_selectedIndex]),
          ],
        ),
      );
    }
  }
}
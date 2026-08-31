import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicios_modelos_app/providers/device_data_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Panel del Dispositivo', style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            _buildMobileLayout(),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Consumer<DeviceDataProvider>(
      builder: (_, provider, __) => Column(
        children: [
          _statusCard('Estado del Dispositivo', 'Listo', Icons.info, Colors.orange),
          const SizedBox(height: 12),
          _statusCard('Conexión', provider.connectivity, Icons.wifi, Colors.blue),
          const SizedBox(height: 12),
          if (provider.accelerometer != null)
            _statusCard('Acelerómetro', 'X: ${provider.accelerometer!.x.toStringAsFixed(2)}', Icons.sensors, Colors.purple),
          const SizedBox(height: 12),
          _statusCard('Ubicación', 'Lat: ${provider.location['latitude']?.toStringAsFixed(4) ?? 'N/D'}', Icons.location_on, Colors.red),
        ],
      ),
    );
  }

  Widget _statusCard(String title, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
                  Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
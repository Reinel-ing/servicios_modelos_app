import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicios_modelos_app/providers/device_data_provider.dart';

class SensorsScreen extends StatelessWidget {
  const SensorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sensores'), automaticallyImplyLeading: false),
      body: Consumer<DeviceDataProvider>(
        builder: (_, provider, __) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _sensorCard('Acelerómetro', provider.accelerometer, ['X', 'Y', 'Z'], Colors.blue),
              const SizedBox(height: 16),
              _sensorCard('Giroscopio', provider.gyroscope, ['X', 'Y', 'Z'], Colors.green),
              const SizedBox(height: 16),
              _sensorCard('Magnetómetro', provider.magnetometer, ['X', 'Y', 'Z'], Colors.orange),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sensorCard(String title, dynamic data, List<String> axes, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.sensors, color: color, size: 28),
                const SizedBox(width: 8),
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 12),
            if (data != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${axes[0]}: ${data.x.toStringAsFixed(3)}'),
                  Text('${axes[1]}: ${data.y.toStringAsFixed(3)}'),
                  Text('${axes[2]}: ${data.z.toStringAsFixed(3)}'),
                ],
              )
            else
              const Text('Sin datos disponibles'),
          ],
        ),
      ),
    );
  }
}
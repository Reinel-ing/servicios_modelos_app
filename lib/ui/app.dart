import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicios_modelos_app/theme.dart';
import 'package:servicios_modelos_app/providers/device_data_provider.dart';
import 'package:servicios_modelos_app/screens/main_shell.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DeviceDataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dispositivo Responsivo',
        theme: appTheme,
        home: const MainShell(),
      ),
    );
  }
}
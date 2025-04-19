import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Image Viewer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 183, 85)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dynamic Image Viewer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentImage = 'assets/images/ev.jpeg';

  void _changeImage(String imagePath) {
    setState(() {
      _currentImage = imagePath;
    });
  }

  String _getImageLabel(String path) {
    if (path.contains('ev')) return '1. Electric Vehicle';
    if (path.contains('city')) return '2. City View';
    if (path.contains('arch')) return '3. Architecture';
    return 'Image Viewer';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
  'Made by Fnu Abdullah',
  style: const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 0, 84, 60),
    letterSpacing: 1.2,
  ),
  textAlign: TextAlign.center,
),
const SizedBox(height: 20),
Text(
  _getImageLabel(_currentImage),
  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  textAlign: TextAlign.center,
),

            const SizedBox(height: 10),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Image.asset(
                _currentImage,
                key: ValueKey<String>(_currentImage),
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () => _changeImage('assets/images/ev.jpeg'),
              icon: const Icon(Icons.electric_car),
              label: const Text('Red - EV'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => _changeImage('assets/images/city.jpg'),
              icon: const Icon(Icons.location_city),
              label: const Text('Green - City'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => _changeImage('assets/images/arch.jpg'),
              icon: const Icon(Icons.architecture),
              label: const Text('Blue - Arch'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

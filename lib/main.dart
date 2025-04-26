import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(MyMeditationApp());

class MyMeditationApp extends StatefulWidget {
  @override
  _MyMeditationAppState createState() => _MyMeditationAppState();
}

class _MyMeditationAppState extends State<MyMeditationApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MeditationHome(),
    MeditationHistory(),
    MeditationGuide(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal.shade50,
        textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.teal.shade900)),
      ),
      home: Scaffold(
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.teal,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.self_improvement), label: 'Meditate'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'History'),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Guide'),
          ],
          onTap: (index) => setState(() => _currentIndex = index),
        ),
      ),
    );
  }
}

class MeditationHome extends StatefulWidget {
  @override
  _MeditationHomeState createState() => _MeditationHomeState();
}

class _MeditationHomeState extends State<MeditationHome> {
  final AudioPlayer _player = AudioPlayer();
  int _selectedTime = 300;
  bool _isMeditating = false;
  int _elapsedSeconds = 0;
  Timer? _timer;
  String _selectedSound = 'calm.m4a';

  static List<String> history = [];

  void startMeditation() async {
    setState(() {
      _isMeditating = true;
      _elapsedSeconds = 0;
    });

    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.play(AssetSource('audio/$_selectedSound'));

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!mounted) return;
      setState(() => _elapsedSeconds++);

      if (_elapsedSeconds >= _selectedTime) stopMeditation();
    });
  }

  void stopMeditation() {
    _player.stop();
    _timer?.cancel();
    setState(() {
      _isMeditating = false;
      history.add('${DateTime.now().toString().substring(0, 16)} - ${_elapsedSeconds ~/ 60} min ${_elapsedSeconds % 60} sec');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!_isMeditating) ...[
            Text('Choose Duration', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                meditationButton('5 min', 300),
                meditationButton('10 min', 600),
                meditationButton('30 min', 1800),
              ],
            ),
            SizedBox(height: 20),
            Text('Choose Ambient Sound', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              children: [
                soundButton('Calm', 'calm.m4a'),
                soundButton('Forest', 'forest.m4a'),
                soundButton('Ocean', 'ocean.m4a'),
                soundButton('Rain', 'rain.m4a'),
              ],
            ),
          ] else ...[
            Center(child: Icon(Icons.self_improvement, size: 80, color: Colors.teal)),
            SizedBox(height: 20),
            Center(child: Text('Relax and Breathe', style: TextStyle(fontSize: 22))),
            SizedBox(height: 10),
            Center(
              child: Text(formatElapsedTime(_elapsedSeconds),
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
          ],
          SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
              backgroundColor: Colors.teal,
            ),
            onPressed: _isMeditating ? stopMeditation : startMeditation,
            child: Text(
              _isMeditating ? 'Stop' : 'Start',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget meditationButton(String text, int time) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: ChoiceChip(
        label: Text(text, style: TextStyle(color: _selectedTime == time ? Colors.white : Colors.black)),
        selectedColor: Colors.teal,
        selected: _selectedTime == time,
        onSelected: (_) => setState(() => _selectedTime = time),
      ),
    );
  }

  Widget soundButton(String label, String fileName) {
    return ChoiceChip(
      label: Text(label, style: TextStyle(color: _selectedSound == fileName ? Colors.white : Colors.black)),
      selectedColor: Colors.teal,
      selected: _selectedSound == fileName,
      onSelected: (_) => setState(() => _selectedSound = fileName),
    );
  }

  String formatElapsedTime(int seconds) {
    final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
    final secs = (seconds % 60).toString().padLeft(2, '0');
    return '$minutes:$secs';
  }

  @override
  void dispose() {
    _player.dispose();
    _timer?.cancel();
    super.dispose();
  }
}

class MeditationHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Text('Meditation History', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          ..._MeditationHomeState.history.map((h) => ListTile(
                leading: Icon(Icons.check_circle_outline, color: Colors.teal),
                title: Text(h),
              )),
        ],
      ),
    );
  }
}

class MeditationGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Text('How to Meditate', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text('1. Find a quiet and comfortable place where you can sit or lie down.', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('2. Close your eyes and take deep, slow breaths.', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('3. Focus on your breathing. Feel the air enter and leave your body.', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('4. If your mind wanders, gently bring your attention back to your breath.', style: TextStyle(fontSize: 18)),
          SizedBox(height: 10),
          Text('5. Continue for the duration you selected. Open your eyes slowly when finished.', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}

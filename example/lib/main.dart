import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badge/flutter_app_badge.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _supportedStatus = ValueNotifier<String>('Unknown');
  IconData _supportedIcon = Icons.question_mark;

  @override
  initState() {
    super.initState();
    _supportedStatus.addListener(() => setState(() {}));
    _initPlatformState();
  }

  @override
  dispose() {
    _supportedStatus.dispose();
    super.dispose();
  }

  _initPlatformState() async {
    try {
      final bool supported = await FlutterAppBadger.isAppBadgeSupported();
      if (supported) {
        _supportedIcon = Icons.check;
        _supportedStatus.value = 'Supported';
      } else {
        _supportedIcon = Icons.close;
        _supportedStatus.value = 'Not supported';
      }
    } on PlatformException {
      _supportedStatus.value = 'Failed to get badge support.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_app_badge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_app_badge'),
        ),
        body: ListView(
          children: [
            ListTile(
              leading: Icon(_supportedIcon),
              title: Text(_supportedStatus.value),
              subtitle: const Text('Badge support status'),
            ),
            for (int i in [10, 1, 0, -1])
              ListTile(
                onTap: () => FlutterAppBadger.updateBadgeCount(i),
                leading: Icon(i > 0 ? Icons.add : Icons.remove),
                title: Text('.updateBadgeCount($i)'),
              ),
          ],
        ),
      ),
    );
  }
}

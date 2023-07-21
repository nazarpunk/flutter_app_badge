import 'package:flutter/material.dart';
import 'package:flutter_app_badge/flutter_app_badge.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final _supportedStatus = ValueNotifier<String>('Unknown');

  @override
  initState() {
    super.initState();
    _supportedStatus.addListener(() => setState(() {}));
  }

  @override
  dispose() {
    _supportedStatus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_app_badge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('flutter_app_badge'),
        ),
        body: ListView(
          children: [
            for (int i in [10, 1, 0, -1])
              ListTile(
                onTap: () => FlutterAppBadge.count(i),
                leading: Icon(i > 0 ? Icons.add : Icons.remove),
                title: Text('FlutterAppBadge.count($i)'),
              ),
          ],
        ),
      ),
    );
  }
}

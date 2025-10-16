import 'package:demo/pages/automation_device.dart';
import 'package:demo/pages/home_automation.dart';
import 'package:demo/pages/lamp_controller.dart';
import 'package:flutter/material.dart';

/// Demo app entry point.
///
/// This app contains a simple bottom navigation with three pages:
/// - HomeAutomation
/// - AutomationDevice
/// - LampController
///
/// Notes and tips:
/// - Avoid calling Navigator.push/pop synchronously inside `build()`; instead
///   perform navigation in response to user actions or inside a
///   `WidgetsBinding.instance.addPostFrameCallback` callback.
/// - If you see `RenderFlex overflowed` errors, consider wrapping content in
///   `SingleChildScrollView`, constraining large images, or using `Expanded`/
///   `Flexible` to make layouts responsive.

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int _index = 0;

  final List<Widget> pages = [
    const HomeAutomation(),
    const AutomationDevice(),
    const LampController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      // 页面由 pages 数组控制。确保每个 page 自身能够适配可用空间，
      // 例如在竖向方向内容超出时使用 SingleChildScrollView。
      body: pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xfff5f5f5),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        showSelectedLabels: true,
        currentIndex: _index,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Color(0xfff5f5f5)),
          BottomNavigationBarItem(
              icon: Icon(Icons.sync_alt),
              label: "Devices",
              backgroundColor: Color(0xfff5f5f5)),
          BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb),
              label: "Lamp",
              backgroundColor: Color(0xfff5f5f5)),
        ],
      ),
    );
  }

  _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }
}

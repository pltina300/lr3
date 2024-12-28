
import 'package:flutter/material.dart';
import 'package:katsimon_oleh_kiuki_21_9/widgets/student_screen.dart';

import 'DepartmentScreen.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedTabIndex = 0;

  final List<Map<String, Object>> _pages = [
    {
      'page': DepartmentsScreen(),
      'title': 'Departments',
    },
    {
      'page': StudentsScreen(),
      'title': 'Students',
    },
  ];

  void _selectTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedTabIndex]['title'] as String),
      ),
      body: _pages[_selectedTabIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _selectTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Departments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Students',
          ),
        ],
      ),
    );
  }
}
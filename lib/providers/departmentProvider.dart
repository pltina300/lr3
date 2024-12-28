import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katsimon_oleh_kiuki_21_9/models/department.dart';
import 'package:katsimon_oleh_kiuki_21_9/providers/studentsProvider.dart';
import '../main.dart';

final departmentsProvider = StateNotifierProvider<DepartmentsNotifier, List<Department>>((ref) {
  return DepartmentsNotifier([
    Department(
      id: '1',
      name: 'Computer Engineering',
      color: Colors.blue,
      icon: Icons.computer,
      studentsEnrolled: 0
    ),
    Department(
      id: '2',
      name: 'Computer Science',
      color: Colors.green.shade800,
      icon: Icons.science,
      studentsEnrolled: 0
    ),
    
    Department(
      id: '3',
      name: 'Cybersecurity',
      color: Colors.purple,
      icon: Icons.security,
      studentsEnrolled: 0
    ),
    Department(
      id: '4',
      name: 'Artificial Inteligence',
      color: Colors.pink.shade700,
      icon: Icons.smart_toy,
      studentsEnrolled: 0
    ),
  ]);
});

class DepartmentsNotifier extends StateNotifier<List<Department>> {
  DepartmentsNotifier(super.state);

  void updateStudentCount(String departmentId, int countChange) {
    state = state.map((dept) {
      if (dept.id == departmentId) {
        return Department(
          id: dept.id,
          name: dept.name,
          color: dept.color,
          icon: dept.icon,
          studentsEnrolled: dept.studentsEnrolled + countChange,
        );
      }
      return dept;
    }).toList();
  }
}
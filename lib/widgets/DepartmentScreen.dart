import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:katsimon_oleh_kiuki_21_9/models/departmentCard.dart';
import 'package:katsimon_oleh_kiuki_21_9/providers/studentsProvider.dart';

import '../models/department.dart';
import '../providers/departmentProvider.dart';

class DepartmentsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final departments = ref.watch(departmentsProvider);
    final students = ref.watch(studentsProvider);

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: departments.length,
        itemBuilder: (context, index) {
          final dept = departments[index];
          return DepartmentCard(
            id: dept.id,
            title: dept.name,
            highlightColor: dept.color,
            departmentIcon: dept.icon,
            enrolledCount: dept.studentsEnrolled,
          );
        },
      ),
    );
  }
}

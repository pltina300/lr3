import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/student.dart';
import 'departmentProvider.dart';

final studentsProvider =
    StateNotifierProvider<StudentsNotifier, List<Student>>((ref) {
      final departments = ref.read(departmentsProvider);
      List<Student> init = [
  Student(firstName: 'Alice', lastName: 'Johnson', department: departments[0], gender: Gender.female, grade: 85),
  Student(firstName: 'Bob', lastName: 'Williams', department: departments[1], gender: Gender.male, grade: 78),
  Student(firstName: 'Charlie', lastName: 'Brown', department: departments[2], gender: Gender.male, grade: 92),
  Student(firstName: 'Diana', lastName: 'King', department: departments[3], gender: Gender.female, grade: 88),
  Student(firstName: 'Ethan', lastName: 'Miller', department: departments[2], gender: Gender.male, grade: 74),
];

  init.forEach((s){
    departments.forEach((d){
      if(s.department.id == d.id){
        d.addStudent();
      }
    });
  });

  return StudentsNotifier(ref,init);
});

class StudentsNotifier extends StateNotifier<List<Student>> {
 final Ref ref;

  StudentsNotifier(this.ref, super.state);

 void addStudent(Student newStudent) {
    state = [...state, newStudent];
    ref.read(departmentsProvider.notifier).updateStudentCount(newStudent.department.id, 1);
  }

  void editStudent(Student student, int index) {
    final newState = [...state];
    newState[index] = Student(
      
      firstName: student.firstName,
      lastName: student.lastName,
      department: student.department,
      gender: student.gender,
      grade: student.grade,
    );
    state = newState;
  }

  void insertStudent(Student student, int index) {
    final newState = [...state];
    newState.insert(index, student);
    state = newState;
    ref.read(departmentsProvider.notifier).updateStudentCount(student.department.id, 1);
  }

  void removeStudent(Student student) {
    if(state.contains(student)){
      state = state.where((m) => m.id != student.id).toList();
      ref.read(departmentsProvider.notifier).updateStudentCount(student.department.id, -1);
    }
  }
}
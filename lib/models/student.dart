import 'package:flutter/material.dart';
import 'package:katsimon_oleh_kiuki_21_9/models/department.dart';

enum Gender {
  male,
  female
}

class Student {
  String? id;
  String firstName;
  String lastName;
  Department department;
  int grade;
  Gender gender;

   Student({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.grade,
    required this.gender,
  }){
      if(this.id == null){
          this.id = DateTime.now().toString();
      }
  }

}
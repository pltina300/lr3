import 'package:flutter/material.dart';

class DepartmentCard extends StatelessWidget {
  final String id;
  final String title;
  final Color highlightColor;
  final IconData departmentIcon;
  final int enrolledCount;

  const DepartmentCard({
    required this.id,
    required this.title,
    required this.highlightColor,
    required this.departmentIcon,
    required this.enrolledCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: highlightColor.withOpacity(0.8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title.toUpperCase(),
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 6),
              Text(
                'Enrolled: $enrolledCount',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black54,
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  departmentIcon,
                  size: 28,
                  color: highlightColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

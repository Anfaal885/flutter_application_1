import 'package:flutter/material.dart';
import 'employee.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  final Employee employee;

  const EmployeeDetailsScreen({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Details'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                child: Text(
                  employee.name[0],
                  style: const TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            Text(
              employee.name,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Text('ID: ${employee.id}'),

            const SizedBox(height: 8),

            Text(
              'Designation: ${employee.designation}',
            ),

            const SizedBox(height: 8),

            Text(
              'Department: ${employee.department}',
            ),

            const SizedBox(height: 8),

            Text(
              'Email: ${employee.email}',
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'employee.dart';
import 'employee_details_screen.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;

  const EmployeeCard({
    super.key,
    required this.employee,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(employee.name[0]),
        ),

        title: Text(
          employee.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),

            Chip(
              label: Text(employee.designation),
              avatar: const Icon(
                Icons.work,
                size: 18,
              ),
            ),

            Text(employee.department),
            Text(employee.email),
          ],
        ),

        isThreeLine: true,

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),

        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EmployeeDetailsScreen(
                  employee: employee,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
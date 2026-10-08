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
            Text(employee.designation),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(
                  Icons.business,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text(employee.department),
              ],
            ),
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

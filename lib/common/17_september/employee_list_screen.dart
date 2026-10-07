import 'package:flutter/material.dart';
import 'employee.dart';
import 'employee_card.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() =>
      _EmployeeListScreenState();
}

class _EmployeeListScreenState
    extends State<EmployeeListScreen> {
  final List<Employee> employees = [
    const Employee(
      id: 1,
      name: 'Ali Khan',
      designation: 'Software Engineer',
      department: 'IT',
      email: 'ali@gmail.com',
      image: '',
    ),

    const Employee(
      id: 2,
      name: 'Sara Ahmed',
      designation: 'UI/UX Designer',
      department: 'Design',
      email: 'sara@gmail.com',
      image: '',
    ),

    const Employee(
      id: 3,
      name: 'Hamza Malik',
      designation: 'HR Manager',
      department: 'HR',
      email: 'hamza@gmail.com',
      image: '',
    ),

    const Employee(
      id: 4,
      name: 'Ayesha Noor',
      designation: 'Flutter Developer',
      department: 'IT',
      email: 'ayesha@gmail.com',
      image: '',
    ),

    const Employee(
      id: 5,
      name: 'Usman Ali',
      designation: 'Graphic Designer',
      department: 'Design',
      email: 'usman@gmail.com',
      image: '',
    ),
  ];

  String searchText = '';
  String selectedDepartment = 'All';

  @override
  Widget build(BuildContext context) {
    final filteredEmployees = employees.where((employee) {
      final searchMatch = employee.name
          .toLowerCase()
          .contains(searchText.toLowerCase());

      final departmentMatch =
          selectedDepartment == 'All' ||
          employee.department == selectedDepartment;

      return searchMatch && departmentMatch;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Directory'),
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search employee',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),

              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: DropdownButtonFormField<String>(
              value: selectedDepartment,

              decoration: InputDecoration(
  hintText: 'Search employee',
  prefixIcon: const Icon(Icons.search),
  suffixIcon: searchText.isNotEmpty
      ? IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            setState(() {
              searchText = '';
            });
          },
        )
      : null,
  border: const OutlineInputBorder(),
),

              items: const [
                DropdownMenuItem(
                  value: 'All',
                  child: Text('All Departments'),
                ),

                DropdownMenuItem(
                  value: 'IT',
                  child: Text('IT'),
                ),

                DropdownMenuItem(
                  value: 'Design',
                  child: Text('Design'),
                ),

                DropdownMenuItem(
                  value: 'HR',
                  child: Text('HR'),
                ),
              ],

              onChanged: (value) {
                setState(() {
                  selectedDepartment = value!;
                });
              },
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: filteredEmployees.isEmpty
                ? const Center(
                    child: Text(
                      'No employee found',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredEmployees.length,

                    itemBuilder: (context, index) {
                      final employee =
                          filteredEmployees[index];

                      return EmployeeCard(
                        employee: employee,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
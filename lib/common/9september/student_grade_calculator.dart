
import 'package:flutter/material.dart';

class StudentGradeCalculator extends StatefulWidget {
  const StudentGradeCalculator({super.key});

  @override
  State<StudentGradeCalculator> createState() =>
      _StudentGradeCalculatorState();
}

class _StudentGradeCalculatorState
    extends State<StudentGradeCalculator> {
  TextEditingController nameController = TextEditingController();

  TextEditingController subject1Controller = TextEditingController();
  TextEditingController subject2Controller = TextEditingController();
  TextEditingController subject3Controller = TextEditingController();
  TextEditingController subject4Controller = TextEditingController();
  TextEditingController subject5Controller = TextEditingController();

  String result = "";

  void calculateGrade() {
    String name = nameController.text;

    double marks1 = double.tryParse(subject1Controller.text) ?? 0;
    double marks2 = double.tryParse(subject2Controller.text) ?? 0;
    double marks3 = double.tryParse(subject3Controller.text) ?? 0;
    double marks4 = double.tryParse(subject4Controller.text) ?? 0;
    double marks5 = double.tryParse(subject5Controller.text) ?? 0;

    double total = marks1 + marks2 + marks3 + marks4 + marks5;
    double percentage = total / 5;

    String grade;

    if (percentage >= 80) {
      grade = "A";
    } else if (percentage >= 70) {
      grade = "B";
    } else if (percentage >= 60) {
      grade = "C";
    } else if (percentage >= 50) {
      grade = "D";
    } else {
      grade = "F";
    }

    setState(() {
      result = """
Student Name: $name

Total Marks: $total / 500

Percentage: ${percentage.toStringAsFixed(2)}%

Grade: $grade
""";
    });
  }

  Widget marksField(String subject, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: "$subject Marks",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Grade Calculator"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              "Student Information",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Student Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            marksField("Subject 1", subject1Controller),
            marksField("Subject 2", subject2Controller),
            marksField("Subject 3", subject3Controller),
            marksField("Subject 4", subject4Controller),
            marksField("Subject 5", subject5Controller),

            const SizedBox(height: 10),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: calculateGrade,
                child: const Text(
                  "Calculate Grade",
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),

            const SizedBox(height: 25),

            if (result.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  result,
                  style: const TextStyle(
                    fontSize: 18,
                    height: 1.6,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}


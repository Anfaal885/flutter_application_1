import 'package:flutter/material.dart';



// 1. Stdnt cls

class Student {
  // Properties
  int id;
  String name;
  int age;
  String email;
  double marks;

  // Constructor
  Student({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.marks,
  });

  // Named Constructor
  Student.empty()
      : id = 0,
        name = "Unknown",
        age = 0,
        email = "No Email",
        marks = 0;

  // Getter
  String get grade {
    if (marks >= 80) {
      return "A";
    } else if (marks >= 70) {
      return "B";
    } else if (marks >= 60) {
      return "C";
    } else if (marks >= 50) {
      return "D";
    } else {
      return "F";
    }
  }

  // Setter
  set updateMarks(double newMarks) {
    if (newMarks >= 0 && newMarks <= 100) {
      marks = newMarks;
    }
  }

  // Method
  String getStudentInfo() {
    return "$name | Age: $age | Marks: $marks | Grade: $grade";
  }

  // toString()
  @override
  String toString() {
    return "Student(id: $id, name: $name, age: $age, "
        "email: $email, marks: $marks)";
  }
}


// 2. INHERITANCE

// Student ke child class
class GraduateStudent extends Student {

  String specialization;

  GraduateStudent({
    required int id,
    required String name,
    required int age,
    required String email,
    required double marks,
    required this.specialization,
  }) : super(
          id: id,
          name: name,
          age: age,
          email: email,
          marks: marks,
        );

  // Overriding parent method
  @override
  String getStudentInfo() {
    return "$name | $specialization | Marks: $marks | Grade: $grade";
  }
}



// 3. Cours class 


class Course {
  String courseName;
  List<Student> students;

  Course({
    required this.courseName,
    required this.students,
  });

  // Add student to course
  void addStudent(Student student) {
    students.add(student);
  }

  // Method
  String getCourseInfo() {
    return "$courseName - ${students.length} Students";
  }
}



// 4. Stednt mngmnt scren


class StudentManagement extends StatefulWidget {
  const StudentManagement({super.key});

  @override
  State<StudentManagement> createState() =>
      _StudentManagementState();
}


class _StudentManagementState extends State<StudentManagement> {

  
  // 5. Multiple Student OBJECTS
  

  List<Student> students = [

    Student(
      id: 101,
      name: "Anfaal Shahid",
      age: 21,
      email: "anfaal324@gmail.com",
      marks: 88,
    ),

    Student(
      id: 102,
      name: "Ayesha Khan",
      age: 22,
      email: "ayesha45@gmail.com",
      marks: 76,
    ),

    Student(
      id: 103,
      name: "Sara Ahmed",
      age: 20,
      email: "sara32@gmail.com",
      marks: 92,
    ),

    Student(
      id: 104,
      name: "Hina Ali",
      age: 21,
      email: "hina15@gmail.com",
      marks: 68,
    ),
  ];

  // 6. COURSE OBJECT
  

  late Course flutterCourse;


  @override
  void initState() {
    super.initState();

    flutterCourse = Course(
      courseName: "Flutter Development",
      students: students,
    );
  }


  
  // 7. FIND STUDENT BY ID
  

  Student? findStudentById(int id) {

    for (Student student in students) {

      if (student.id == id) {
        return student;
      }
    }

    return null;
  }


  
  // 8. CALCULATE AVERAGE MARKS

  double calculateAverageMarks() {

    double total = 0;

    for (Student student in students) {
      total += student.marks;
    }

    return total / students.length;
  }


  // ==========================================================
  // 9. SORT STUDENTS BY MARKS
  // ==========================================================

  void sortStudentsByMarks() {

    setState(() {

      students.sort(
        (a, b) => b.marks.compareTo(a.marks),
      );

    });
  }


  // ==========================================================
  // 10. UI
  // ==========================================================

  @override
  Widget build(BuildContext context) {

    double average = calculateAverageMarks();

    return Scaffold(

      backgroundColor: const Color(0xffF5F7FB),

      appBar: AppBar(

        title: const Text(
          "Student Management",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        backgroundColor: const Color(0xff263A5B),

        foregroundColor: Colors.white,
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // ==================================================
            // HEADER
            // ==================================================

            const Text(
              "Student Dashboard",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              "Manage student academic information",
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 20),


            // ==================================================
            // STATISTICS
            // ==================================================

            Row(

              children: [

                Expanded(
                  child: statCard(
                    "Students",
                    students.length.toString(),
                    Icons.people,
                    Colors.blue,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: statCard(
                    "Average",
                    average.toStringAsFixed(1),
                    Icons.analytics,
                    Colors.green,
                  ),
                ),
              ],
            ),


            const SizedBox(height: 20),


            // ==================================================
            // COURSE
            // ==================================================

            Container(

              width: double.infinity,

              padding: const EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),

              child: Row(

                children: [

                  const Icon(
                    Icons.school,
                    color: Colors.indigo,
                    size: 35,
                  ),

                  const SizedBox(width: 15),

                  Column(

                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      const Text(
                        "Course",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      Text(
                        flutterCourse.courseName,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(
                        "${flutterCourse.students.length} Students",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),


            const SizedBox(height: 25),


            // ==================================================
            // STUDENTS HEADING
            // ==================================================

            Row(

              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

              children: [

                const Text(
                  "All Students",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                ElevatedButton.icon(

                  onPressed: sortStudentsByMarks,

                  icon: const Icon(Icons.sort),

                  label: const Text("Sort Marks"),
                ),
              ],
            ),


            const SizedBox(height: 15),


            // ==================================================
            // STUDENT INFORMATION
            // ==================================================

            ...students.map(
              (student) => studentCard(student),
            ),
          ],
        ),
      ),
    );
  }


  // ==========================================================
  // STAT CARD
  // ==========================================================

  Widget statCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {

    return Container(

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Icon(
            icon,
            color: color,
            size: 30,
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }


  // ==========================================================
  // STUDENT CARD
  // ==========================================================

  Widget studentCard(Student student) {

    return Container(

      margin: const EdgeInsets.only(bottom: 14),

      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(16),

        boxShadow: [

          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
          ),
        ],
      ),

      child: Column(

        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Row(

            children: [

              CircleAvatar(

                radius: 25,

                backgroundColor:
                    const Color(0xff263A5B),

                child: Text(

                  student.name[0],

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              const SizedBox(width: 12),


              Expanded(

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    Text(
                      student.name,

                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "ID: ${student.id}",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),


              Container(

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),

                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius:
                      BorderRadius.circular(20),
                ),

                child: Text(

                  "${student.marks}%",

                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),


          const SizedBox(height: 15),

          const Divider(),

          const SizedBox(height: 8),


          Text(
            "Age: ${student.age}",
            style: const TextStyle(
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            "Email: ${student.email}",
            style: const TextStyle(
              fontSize: 15,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            "Grade: ${student.grade}",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

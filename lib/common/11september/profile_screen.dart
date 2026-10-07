
import 'package:flutter/material.dart';


// Profile scrn


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

  

      appBar: AppBar(
        backgroundColor: const Color(0xff263A5B),
        foregroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          "My Profile",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),

      
      // Body

      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              
              // Prfil Img
              

              Container(
                width: 120,
                height: 120,

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  border: Border.all(
                    color: Colors.white,
                    width: 5,
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 15,
                    ),
                  ],
                ),

                child: ClipOval(
                  child: Image.asset(
                    "assets/profile.png",
                    fit: BoxFit.cover,

                    errorBuilder:
                        (context, error, stackTrace) {

                      return Container(
                        color: const Color(0xff263A5B),

                        child: const Icon(
                          Icons.person,
                          size: 65,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 18),


              
              // Name
              

              const Text(
                "Anfaal Shahid",

                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1E293B),
                ),
              ),

              const SizedBox(height: 6),


              
              //  BIO
              

              Text(
                "BS IT Student • Flutter Developer",

                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 25),


              
              // Information card
          

              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  children: [

                    // Email
                    profileInfo(
                      Icons.email_outlined,
                      "Email",
                      "anfaalshahid324@gmail.com",
                    ),

                    const SizedBox(height: 20),

                    // Phone
                    profileInfo(
                      Icons.phone_outlined,
                      "Phone",
                      "+92 300 000000000",
                    ),

                    const SizedBox(height: 20),

                    // Location
                    profileInfo(
                      Icons.location_on_outlined,
                      "Location",
                      "Lahore, Pakistan",
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),


              
              // About me
              
              Container(
                width: double.infinity,

                padding: const EdgeInsets.all(20),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    const Text(
                      "About Me",

                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1E293B),
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      "I am an IT student interested in Flutter, "
                      "UI/UX design and Artificial Intelligence. "
                      "I enjoy creating modern and user-friendly "
                      "mobile applications.",

                      style: TextStyle(
                        fontSize: 15,
                        height: 1.6,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),


              // ==================================================
              // Edit profl btn
              

              SizedBox(
                width: double.infinity,
                height: 52,

                child: ElevatedButton.icon(

                  onPressed: () {},

                  icon: const Icon(
                    Icons.edit_outlined,
                  ),

                  label: const Text(
                    "Edit Profile",

                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xff263A5B),

                    foregroundColor: Colors.white,

                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }


  
  // Profil infrmtion widgt


  Widget profileInfo(
    IconData icon,
    String title,
    String value,
  ) {

    return Row(
      children: [

        // Icon Container
        Container(
          width: 45,
          height: 45,

          decoration: BoxDecoration(
            color: const Color(0xffEEF2FF),
            borderRadius:
                BorderRadius.circular(12),
          ),

          child: Icon(
            icon,
            color: const Color(0xff263A5B),
            size: 23,
          ),
        ),

        const SizedBox(width: 14),

        // Text
        Expanded(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [

              Text(
                title,

                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade500,
                ),
              ),

              const SizedBox(height: 3),

              Text(
                value,

                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff1E293B),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


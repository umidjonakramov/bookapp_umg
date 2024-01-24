import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: const ShapeDecoration(
              color: Color(0xD8F26B6C),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){

                        },
                        child: Image.asset("assets/images/arrowback.png", color: Colors.white),
                      ),
                      Text(
                        'Profile',
                        style: GoogleFonts.ubuntu(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: const Icon(Icons.edit_calendar_outlined, color : Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 45),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(150),
                    child: Image.asset(
                      "assets/images/img.png",
                      width: 122,
                      height: 122,
                      fit: BoxFit.cover,
                    )
                  ),

                  const SizedBox(height: 15),
                  Text(
                    'Sample Sample',
                    style: GoogleFonts.ubuntu(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('User Name',
                        style: GoogleFonts.ubuntu(
                          color: const Color(0xFFF26B6C),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        )),
                    Text(
                      'Sample',
                      style: GoogleFonts.ubuntu(
                        color: const Color(0xFF787878),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Email',
                        style: GoogleFonts.ubuntu(
                          color: const Color(0xFFF26B6C),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        )),
                    Text(
                      'sample@gmail.com',
                      style: GoogleFonts.ubuntu(
                        color: const Color(0xFF787878),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Change Password',
                        style: GoogleFonts.ubuntu(
                          color: const Color(0xFFF26B6C),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        )),
                    const Icon(Icons.arrow_forward_ios, color: Color(0xff787878),)
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Notification',
                        style: GoogleFonts.ubuntu(
                          color: const Color(0xFFF26B6C),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        )),
                    const Icon(Icons.notifications, color: Color(0xff787878),)
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Enable Dark Mode',
                        style: GoogleFonts.ubuntu(
                          color: const Color(0xFFF26B6C),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        )),
                    const Icon(Icons.nights_stay, color: Color(0xff787878),)
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Settings',
                        style: GoogleFonts.ubuntu(
                          color: const Color(0xFFF26B6C),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          height: 0,
                        )),
                    const Icon(Icons.settings, color: Color(0xff787878),)
                  ],
                ),
                const SizedBox(height: 5),
                const Divider(),
              ],
            ),
          ),
        )
      ],
    ));
  }
}

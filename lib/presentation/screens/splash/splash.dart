import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/source/local/my_preference.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void fetchUserOrder() {
    if (MyPreference.isRegistered() == true) {
      Navigator.pushReplacementNamed(context, 'main');
    } else {
      Navigator.pushReplacementNamed(context, 'login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4E4),
      body: SafeArea(
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/images/triple.png")),
            Positioned(
                top: 99,
                left: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/logo.png"),
                  ],
                )),
            Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  width: MediaQuery.of(context).size.width,
                  "assets/images/splash.png",
                  fit: BoxFit.cover,
                )),
            Positioned(
              bottom: 50,
              right: 20,
              child: InkWell(
                onTap: () {
                  fetchUserOrder();
                },
                child: Container(
                  decoration: ShapeDecoration(
                    color: const Color(0xFFF26B6C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 9),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Get Started',
                          style: GoogleFonts.ubuntu(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset("assets/images/arrow.png")
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

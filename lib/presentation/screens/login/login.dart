import 'package:bookapp_umg/presentation/screens/login/login_bloc.dart';
import 'package:bookapp_umg/presentation/screens/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/source/local/my_preference.dart';
import '../../../utils/components/InputText.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var _controllerName = TextEditingController();

var _controllerPass = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        logger.d(state.response.toString());
        if(state.response) {
          MyPreference.registerUser();
          Navigator.pushReplacementNamed(context, 'main');
        } else {

        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset("assets/images/triple.png")
              ),
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/arrowback.png", color: const Color(0xFF787878),),
                          const SizedBox(width: 4),
                          Text(
                            'Go Back',
                            style: TextStyle(
                              color: const Color(0xFF787878),
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 62),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/minilogo.png"),
                              const SizedBox(height: 15),
                              Text(
                                'Welcome Back',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Sign In to continue',
                                style: TextStyle(
                                  color: const Color(0xFF787878),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 8),
                      InputEmail(_controllerName),
                      InputPass(_controllerPass, "Password"),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, 'register');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                  color: const Color(0xFFD71920),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      Container(
                        width: 200,
                        decoration: ShapeDecoration(
                          color: Color(0xFFF26B6C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: InkWell(
                            onTap: () {
                              if (isEmailValid(_controllerName.text) && _controllerPass.text.length > 5) {
                                MyPreference.setUser(_controllerName.text);
                                BlocProvider.of<LoginBloc>(context).add(LoginUser(
                                    _controllerName.text, _controllerPass.text));
                                _controllerName.clear();
                                _controllerPass.clear();
                              } else {

                              }
                            },
                            child: Text(
                              'SIGN IN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            )
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'or sign in using',
                        style: TextStyle(
                          color: const Color(0xFF787878),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: (){
                                BlocProvider.of<LoginBloc>(context).add(
                                    RegisterWithGoogle());
                              },
                              child: Image.asset(
                                  width: 36,
                                  height: 36,
                                  "assets/images/google.png")),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: (){

                            },
                              child: Image.asset(width: 36,height: 36,"assets/images/facebook.png")),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, 'register');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: const Color(0xFFD71920),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

bool isEmailValid(String email) {
  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailRegex.hasMatch(email);
}

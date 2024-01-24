import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:logger/logger.dart';
import '../../../data/source/local/my_preference.dart';
import '../../../utils/components/InputText.dart';
import 'register_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

var _controllerName = TextEditingController();
var _controllerPass = TextEditingController();
var _controllerConfirmPass = TextEditingController();
var logger = Logger(
  printer: PrettyPrinter(),
);

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterInitial>(
      listener: (context, state) {
        logger.d(state.response.toString());
        if (state.response) {
          MyPreference.registerUser();
          Navigator.pushReplacementNamed(context, 'main');
        } else {
          MyPreference.registerUser();
          Navigator.pushReplacementNamed(context, 'main');
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      child: Image.asset("assets/images/triple.png"))),
              Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/arrowback.png",
                              color: const Color(0xFF787878)),
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
                      const SizedBox(height: 42),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/minilogo.png"),
                              const SizedBox(height: 15),
                              Text(
                                'Create an Account',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(height: 15),
                              Text(
                                'Register to continue',
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
                      InputPass(_controllerConfirmPass, "Retype password"),
                      const SizedBox(height: 50),
                      Container(
                        width: 200,
                        decoration: ShapeDecoration(
                          color: const Color(0xFFF26B6C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(200),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: InkWell(
                              onTap: () {
                                if (isEmailValid(_controllerName.text) &&
                                    _controllerPass.text ==
                                        _controllerConfirmPass.text &&
                                    _controllerPass.text.length > 5) {
                                  BlocProvider.of<RegisterBloc>(context).add(
                                      RegisterUser(_controllerName.text,
                                          _controllerPass.text));
                                  _controllerName.clear();
                                  _controllerPass.clear();
                                  _controllerConfirmPass.clear();
                                } else {

                                }
                              },
                              child: Text(
                                'REGISTER',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              )),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'or register using',
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
                                BlocProvider.of<RegisterBloc>(context).add(
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
                            child: Image.asset(
                                width: 36,
                                height: 36,
                                "assets/images/facebook.png"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, 'login');
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Text(
                                'Sign up here',
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

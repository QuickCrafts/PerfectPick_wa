import "dart:ui";
import "package:flutter/material.dart";
import "package:perfectpick_wa/presentation/colors.dart";
import "package:perfectpick_wa/data/repositories/auth/auth_repository.dart";
import "package:perfectpick_wa/auxiliar_functions.dart";
import 'package:perfectpick_wa/presentation/widgets/login/login_modal.dart';
import "package:perfectpick_wa/presentation/widgets/Legal/Privacy_policy_page.dart";
import "package:perfectpick_wa/presentation/widgets/Legal/terms_of_service_page.dart";

class SignUpDialog extends StatefulWidget {

  final AuthRepository authRepository;

  const SignUpDialog({Key? key, required this.authRepository}) : super(key: key);

  @override
  SignUpDialogState createState() => SignUpDialogState();
}

class SignUpDialogState extends State<SignUpDialog> {
  bool _isPasswordHiden = true;
  double _passwordSpacing = 10;
  final signUpFirstNameDataController = TextEditingController();
  final signUpLastNameDataController = TextEditingController();
  final signUpEmailDataController = TextEditingController();
  final signUpPasswordDataController = TextEditingController();

  @override
  void dispose() {
    signUpFirstNameDataController.dispose();
    signUpLastNameDataController.dispose();
    signUpEmailDataController.dispose();
    signUpPasswordDataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Container(
            width: 340,
            height: 590,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: 340,
              height: 590,
              decoration: BoxDecoration(
                color: modalBackgroundColor,
                borderRadius: BorderRadius.circular(12),
              ),
            child: Column(
            children: [
              SizedBox(height: 12), // Added padding to the top of the dialog (16 pixels
              Padding(
                padding: EdgeInsets.all(16),
                child: Image.asset(
                  "lib/presentation/images/PerfectPickName.png",
                  width: 262,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 12),
                        Text('Register',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: modalTitleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            )),
                        SizedBox(height: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: TextField(
                                controller: signUpFirstNameDataController,
                                cursorColor: activeColor,
                                cursorHeight: 20,
                                style: TextStyle(color: textInsideFieldColor),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  labelText: 'First name*',
                                  labelStyle: TextStyle(color: labelColor),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: activeColor),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: inactiveColor),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 40, width: 10),
                            Expanded(
                              child: TextField(
                                controller: signUpLastNameDataController,
                                cursorColor: activeColor,
                                cursorHeight: 20,
                                style: TextStyle(color: textInsideFieldColor),
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(bottom: 4),
                                  labelText: 'Last name*',
                                  labelStyle: TextStyle(color: labelColor),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: activeColor),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: inactiveColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: signUpEmailDataController,
                          cursorColor: activeColor,
                          cursorHeight: 20,
                          style: TextStyle(color: textInsideFieldColor),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 4),
                            labelText: 'Email*',
                            labelStyle: TextStyle(color: labelColor),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: activeColor),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: inactiveColor),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: signUpPasswordDataController,
                          cursorColor: activeColor,
                          cursorHeight: 20,
                          style: TextStyle(
                              color: textInsideFieldColor,
                              letterSpacing: _passwordSpacing),
                          obscureText: _isPasswordHiden,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(bottom: 4),
                            labelText: 'Password',
                            labelStyle: TextStyle(color: labelColor),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: activeColor),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: inactiveColor),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordHiden
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: activeColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordHiden = !_isPasswordHiden;
                                  _passwordSpacing = _isPasswordHiden ? 10 : 0;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Wrap(
                            children: [
                              Text(
                                'By selecting Sign up below, I agree to ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: alternativeTextColor,
                                    fontSize: 15),
                              ),
                              InkWell(
                                onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => TermsOfServicePage()),
                                      );
                                },
                                child:
                                  Text(
                                    'Terms of Service ',
                                    style: TextStyle(
                                        color: activeColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: activeColor),
                                  ),
                              ),
                              Text(
                                'and ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: alternativeTextColor,
                                    fontSize: 15),
                              ),
                              InkWell(
                                  onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => PrivacyPolicyPage()),
                                      );
                                },
                                child:
                                  Text(
                                    'Privacy Policy',
                                    style: TextStyle(
                                        color: activeColor,
                                        decoration: TextDecoration.underline,
                                        decorationColor: activeColor),
                                  ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Checkbox.width * 1.5,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 82,
                            height: 36,
                            child: ElevatedButton(
                              onPressed: () async {
                                // Handle login action
                                String email =
                                  signUpEmailDataController.text;
                                String password =
                                  signUpPasswordDataController.text;
                                String firstName =
                                  signUpFirstNameDataController.text;
                                String lastName =
                                  signUpLastNameDataController.text;
                                String birthdate = "2005-02-21"; // See if is needed here
                                bool role = false; // See if is needed here
                                try {
                                  int token = await widget.authRepository
                                      .emailSignUp(email, password, firstName, lastName, birthdate, role);
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: Text('Success'),
                                      content: Text('id: $token'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop();
                                          },
                                          child: Text('Close'),
                                        ),
                                      ],
                                  ));
                                } catch (e) {
                                showDialog(
                                context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Error'),
                                    content: Text('Error: $e'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop();
                                        },
                                        child: Text('Close'),
                                      ),
                                    ],
                                ));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: activeColor,
                                padding: EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Text('Sign Up',
                                  style: TextStyle(color: textInsideButtonColor)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Checkbox.width * 1.5,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: 150,
                            child: TextButton(
                              onPressed: () async {
                                try {
                                  String link = await widget.authRepository
                                      .googleSignUp();
                                  try {
                                    launchAuxiliarURL(link);
                                  } catch (e) {
                                    print(e);
                                  }
                                } catch (e) {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        title: Text('Error'),
                                        content: Text('Error: $e'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pop();
                                            },
                                            child: Text('Close'),
                                          ),
                                        ],
                                      ));
                                  print(e);
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text('or using ',
                                          style: TextStyle(
                                              color: alternativeTextColor,
                                              fontSize: 16)),
                                      Image.asset(
                                        "lib/presentation/images/google_icon.png",
                                        width: 30,
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Checkbox.width * 2,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                            child: Wrap(
                              children: [
                                Text(
                                  'Already have an account? ',
                                  style: TextStyle(color: alternativeTextColor),
                                  overflow: TextOverflow.fade,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    // Handles go to Log In action
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return LoginDialog(authRepository: widget.authRepository);
                                      },
                                    );
                                  },
                                  child: Text('Log In',
                                      style: TextStyle(
                                          color: activeColor,
                                          decoration: TextDecoration.underline,
                                          decorationColor: activeColor)),
                                ),
                              ],
                            )
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        ),
      ],
      ),
    );
  }
}
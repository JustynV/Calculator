import 'package:f_web_authentication/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../../controller/authentication_controller.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _FirebaseSignUpState();
}

class _FirebaseSignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController(text: 'a@a.com');
  final controllerPassword = TextEditingController(text: '123456');
  final controllerFname = TextEditingController(text: "Justyn");
  final controllerLname = TextEditingController(text: "Velasquez");
  final controllerSchool = TextEditingController(text: "Columbo");
  final controllerGrade = TextEditingController(text: "11");
  final controllerBirth = TextEditingController();

  AuthenticationController authenticationController = Get.find();

  verifyEmail(String value) async {
    return await authenticationController.verifyEmail(value);
  }

  _signup(user) async {
    try {
      await authenticationController.signUp(user);

      Get.snackbar(
        "Sign Up",
        'OK',
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (err) {
      logError('SignUp error $err');
      Get.snackbar(
        "Sign Up",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: Container(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Sign Up Information",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controllerFname,
                          decoration:
                              const InputDecoration(labelText: "First name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              logError('First name is empty');
                              return "Enter first name";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: controllerLname,
                          decoration:
                              const InputDecoration(labelText: "Last name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              logError('Last name is empty');
                              return "Enter last name";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: controllerEmail,
                          decoration:
                              const InputDecoration(labelText: "Email address"),
                          validator: (value) {
                            logInfo(value);
                            if (value == null || value.isEmpty) {
                              logError('SignUp validation empty email');
                              return "Enter email";
                            } else if (!value.contains('@')) {
                              logError('SignUp validation invalid email');
                              return "Enter valid email address";
                            } else if (verifyEmail(value)) {
                              return "Email is already in use";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: controllerPassword,
                          decoration:
                              const InputDecoration(labelText: "Password"),
                          keyboardType: TextInputType.number,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter password";
                            } else if (value.length < 6) {
                              return "Password should have at least 6 characters";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controllerSchool,
                          decoration:
                              const InputDecoration(labelText: "School"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter School";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: controllerGrade,
                          decoration: const InputDecoration(labelText: "Grade"),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter grade";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                            controller: controllerBirth,
                            decoration:
                                const InputDecoration(labelText: "Birth Date"),
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                controllerBirth.text =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                              }
                            }),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () async {
                              final form = _formKey.currentState;
                              form!.save();
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (_formKey.currentState!.validate()) {
                                logInfo('SignUp validation form ok');
                                await _signup(User(
                                    firstName: controllerFname.text,
                                    lastName: controllerLname.text,
                                    email: controllerEmail.text,
                                    school: controllerSchool.text,
                                    grade: controllerGrade.text,
                                    bdate: controllerBirth.text,
                                    password: controllerPassword.text,
                                    difficulty:"1"));
                              } else {
                                logError('SignUp validation form nok');
                              }
                              Get.back();
                            },
                            child: const Text("Submit")),
                      ]),
                ))));
  }
}

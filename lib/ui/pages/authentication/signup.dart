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

  Future<bool> validateEmail(String value) async {
    logInfo("Checking email remotely");
    return authenticationController.verifyEmail(value);
  }

  userCreate() {
    return User(
        firstName: controllerFname.text,
        lastName: controllerLname.text,
        email: controllerEmail.text,
        school: controllerSchool.text,
        grade: controllerGrade.text,
        bdate: controllerBirth.text,
        password: controllerPassword.text,
        difficulty: "1");
  }

  _signup(user) async {
    try {
      await authenticationController.signUp(user);
      Get.back();
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
      backgroundColor: Colors.grey[300],
        appBar: AppBar(),
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.all(10),
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
                          height: 7,
                        ),
                        TextFormField(
                          controller: controllerFname,
                          decoration:
                              InputDecoration(labelText: "First name",
                              enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        fillColor: Colors.grey.shade200,
                        filled:true,
                        ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              logError('First name is empty');
                              return "Enter first name";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                      height: 7,
                    ),
                        TextFormField(
                          controller: controllerLname,
                          decoration:
                              InputDecoration(labelText: "Last name",
                              enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        fillColor: Colors.grey.shade200,
                        filled:true,
                        ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              logError('Last name is empty');
                              return "Enter last name";
                            }
                            return null;
                          },
                        ),const SizedBox(
                      height: 7,
                    ),
                        TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: controllerEmail,
                            decoration: InputDecoration(
                                labelText: "Email address",
                                enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        fillColor: Colors.grey.shade200,
                        filled:true,
                        ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                logError('SignUp validation empty email');
                                return "Enter email";
                              } else if (!value.contains('@')) {
                                logError('SignUp validation invalid email');
                                return "Enter valid email address";
                              }
                              return null;
                            }),
                            const SizedBox(
                      height: 7,
                    ),
                        TextFormField(
                          controller: controllerPassword,
                          decoration:
                              InputDecoration(labelText: "Password",
                              enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        fillColor: Colors.grey.shade200,
                        filled:true,
                        ),
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
                          height: 7,
                        ),
                        TextFormField(
                          controller: controllerSchool,
                          decoration:
                              InputDecoration(labelText: "School",
                              enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        fillColor: Colors.grey.shade200,
                        filled:true,
                        ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter School";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                      height: 7,
                    ),
                        TextFormField(
                          controller: controllerGrade,
                          decoration: InputDecoration(labelText: "Grade",
                          enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        fillColor: Colors.grey.shade200,
                        filled:true,
                        ),
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter grade";
                            }
                            if (int.parse(value) < 0 || int.parse(value) > 11) {
                              return "Enter a valid grade";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                      height: 7,
                    ),
                        TextFormField(
                          controller: controllerBirth,
                          decoration:
                              InputDecoration(labelText: "Birth Date",
                              enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                          focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)
                        ),
                        fillColor: Colors.grey.shade200,
                        filled:true,
                        ),
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now());
                            if (pickedDate != null) {
                              controllerBirth.text =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Enter Date of Birth";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextButton(
                            onPressed: () async {
                              final form = _formKey.currentState;
                              form!.save();
                              FocusScope.of(context).requestFocus(FocusNode());
                              if (_formKey.currentState!.validate()) {
                                bool validate =
                                    await validateEmail(controllerEmail.text);
                                logInfo(validate);
                                if (!validate) {
                                  await _signup(userCreate());
                                } else {
                                  Get.snackbar(
                                    "Sign Up",
                                    "Email address already in use",
                                    icon: const Icon(Icons.person,
                                        color: Colors.red),
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                }
                                logInfo('SignUp validation form ok');
                              } else {
                                logError('SignUp validation form nok');
                              }
                            },
                            child: const Text("Submit")),
                      ]),
                ))));
  }
}

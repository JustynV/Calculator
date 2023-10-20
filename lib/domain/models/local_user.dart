

import 'package:hive/hive.dart';

part "local_user.g.dart";

@HiveType(typeId: 0)
class LocalUser extends HiveObject {
  
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String lastName;
  @HiveField(2)
  String email;
  @HiveField(3)
  String school;  
  @HiveField(4)
  String grade;  
  @HiveField(5)
  String bdate;  
  @HiveField(6)
  String password;  
  @HiveField(7)
  String difficulty;
  
  LocalUser({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.school,
    required this.grade,
    required this.bdate,
    required this.password,
    required this.difficulty
  });
  int? id;



  String get gFname => firstName;
  String get gLname => lastName;
  String get gemail => email;
  String get gschool => school;
  String get ggrade => grade;
  String get gbdate => bdate;
  String get gdificulty => difficulty;
  String get emailAddress => email;
  String get gid => id.toString();

  factory LocalUser.fromJson(Map<String, dynamic> json) => LocalUser(
        id: json["id"],
        firstName: json["firstName"] ?? "somefirstName",
        lastName: json["lastName"] ?? "someLastName",
        email: json["email"] ?? "someemail",
        school: json["school"] ?? "someschool",
        grade: json["grade"] ?? "somegrade",
        bdate: json["birthdate"] ?? "somebirthDate",
        password: json["password"] ?? "123",
        difficulty: json["difficulty"] ?? "1"
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "school":school,
        "grade":grade,
        "birthdate":bdate,
        "password":password,
        "difficulty":difficulty
      };
}

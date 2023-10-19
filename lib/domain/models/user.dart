class User {
  User({
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
  String firstName;
  String lastName;
  String email;
  String school;
  String grade;
  String bdate;
  String password;
  String difficulty;

  String get name => '$firstName $lastName';

  String get emailAddress => email;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["firstName"] ?? "somefirstName",
        lastName: json["lastName"] ?? "someLastName",
        email: json["email"] ?? "someemail",
        school: json["school"] ?? "someschool",
        grade: json["grade"] ?? "somegrade",
        bdate: json["birthDate"] ?? "somebirthDate",
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

class Historial {

  Historial({
    this.id,
    required this.q1,
    required this.q2,
    required this.q3,
    required this.q4,
    required this.q5,
    required this.q6,
    required this.time,
    required this.difficulty,
    required this.userID
  });


  int? id;
  String q1;
  String q2;
  String q3;
  String q4;
  String q5;
  String q6;
  String time;
  String difficulty;
  String userID;

  factory Historial.fromJson(Map<String, dynamic> json) => Historial(
        id: json["id"],
        q1: json["Question1"],
        q2: json["Question2"],
        q3: json["Question3"],
        q4: json["Question4"],
        q5: json["Question5"],
        q6: json["Question6"],
        time: json["time"],
        difficulty: json["difficulty"],
        userID:json["userID"]
      );


    Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "Question1": q1,
        "Question2": q2,
        "Question3": q3,
        "Question4": q4,
        "Question5": q5,
        "Question6": q6,
        "time": time,
        "difficulty":difficulty,
        "user": userID
      };
}
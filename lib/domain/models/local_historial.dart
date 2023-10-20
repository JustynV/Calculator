import "package:hive/hive.dart";
 

part "local_historial.g.dart";

@HiveType(typeId: 0)
class LocalHistorial extends HiveObject{
  @HiveField(0)
  String q1;  
  @HiveField(1)
  String q2;  
  @HiveField(2)
  String q3;  
  @HiveField(3)
  String q4;  
  @HiveField(4)
  String q5;  
  @HiveField(5)
  String q6;  
  @HiveField(6)
  String time;  
  @HiveField(7)
  String difficulty;  
  @HiveField(8)
  String userID;
  

  LocalHistorial({
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

  factory LocalHistorial.fromJson(Map<String, dynamic> json) => LocalHistorial(
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
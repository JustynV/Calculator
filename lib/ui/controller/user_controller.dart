import 'package:f_web_authentication/domain/models/user.dart';
import 'package:f_web_authentication/domain/use_case/user_usecase.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserController();

  UserUseCase userUseCase = Get.find();
  RxString firstName = "".obs;
  RxString lastName = "".obs;
  RxString email = "".obs;
  RxString school = "".obs;
  RxString grade = "".obs;
  RxString bdate = "".obs;
  RxString difficulty = "".obs;
  RxString password = "".obs;
  RxString id = "".obs;

  String get gFname => firstName.value;
  String get gLname => lastName.value;
  String get gemail => email.value;
  String get gschool => school.value;
  String get ggrade => grade.value;
  String get gbdate => bdate.value;
  String get gpassword => password.value;
  String get gdificulty => difficulty.value;
  String get getID => id.value;

  setDifficulty(String diff) {
    difficulty.value = diff;
  }

  setUser(User u){
   firstName.value = u.gFname;
   lastName.value  = u.gLname;
   email.value  = u.gemail;
   school.value  = u.gschool;
   grade.value  = u.ggrade;
   bdate.value  = u.gbdate;
   difficulty.value  = u.gdificulty;
   password.value  = u.password;
   id.value  = u.gid;
  }

  Future<void> updateUser() async {
    User user = User(
        firstName: firstName.value,
        lastName: lastName.value,
        email: email.value,
        school: school.value,
        grade: grade.value,
        bdate: bdate.value,
        password: password.value,
        difficulty: difficulty.value,
        id: int.parse(getID));
    await userUseCase.updateUser(user);
  }
}

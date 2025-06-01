import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_prefsname.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetCareThemecontroler extends GetxController{
  @override
  void onInit(){
    SharedPreferences.getInstance().then((value) {
      isdark = value.getBool(petcareDarkMode) ?? false ;
    });
    update();
    super.onInit();
  }

  var isdark = false;
  Future<void> changeTheme (state) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isdark = prefs.getBool(petcareDarkMode) ?? true;
    isdark = !isdark;

    if (state == true) {
      Get.changeTheme(PetCareMythemes.darkTheme);
      isdark = true;
    }
    else {
      Get.changeTheme(PetCareMythemes.lightTheme);
      isdark = false;
    }
    update();
  }

}
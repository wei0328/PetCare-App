import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/petcare_login.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'auth_controller.dart';

class PetCareSignUp extends StatefulWidget {
  const PetCareSignUp({super.key});

  @override
  State<PetCareSignUp> createState() => _PetCareSignUpState();
}

class _PetCareSignUpState extends State<PetCareSignUp> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());

  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureText = true;

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Obx(
      () => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height / 36),
                  Center(
                    child:
                        Image.asset(PetCarePngimage.coco, height: height / 6),
                  ),
                  SizedBox(height: height / 36),
                  TextField(
                    controller: authController.firstNameController,
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    cursorColor: PetCareColor.grey,
                    style: fredokaregular.copyWith(
                        fontSize: 20, color: PetCareColor.black),
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      filled: true,
                      fillColor: PetCareColor.textfield,
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        size: height / 36,
                        color: PetCareColor.grey,
                      ),
                      hintStyle: fredokaregular.copyWith(
                          fontSize: 20, color: PetCareColor.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(
                    height: height / 56,
                  ),
                  TextField(
                    controller: authController.lastNameController,
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    cursorColor: PetCareColor.grey,
                    style: fredokaregular.copyWith(
                        fontSize: 20, color: PetCareColor.black),
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      filled: true,
                      fillColor: PetCareColor.textfield,
                      prefixIcon: Icon(
                        Icons.person_outline_outlined,
                        size: height / 36,
                        color: PetCareColor.grey,
                      ),
                      hintStyle: fredokaregular.copyWith(
                          fontSize: 20, color: PetCareColor.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(
                    height: height / 56,
                  ),
                  TextField(
                    controller: authController.emailController,
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    cursorColor: PetCareColor.grey,
                    style: fredokaregular.copyWith(
                        fontSize: 20, color: PetCareColor.black),
                    decoration: InputDecoration(
                      hintText: 'Email'.tr,
                      filled: true,
                      fillColor: PetCareColor.textfield,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(PetCareSvgicons.mail,
                            height: height / 96),
                      ),
                      hintStyle: fredokaregular.copyWith(
                          fontSize: 20, color: PetCareColor.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(
                    height: height / 56,
                  ),
                  TextField(
                    controller: authController.phoneController,
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    cursorColor: PetCareColor.grey,
                    style: fredokaregular.copyWith(
                        fontSize: 20, color: PetCareColor.black),
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      hintText: 'Phone_Number'.tr,
                      filled: true,
                      fillColor: PetCareColor.textfield,
                      prefixIcon: Icon(
                        Icons.call_outlined,
                        size: height / 36,
                        color: PetCareColor.grey,
                      ),
                      hintStyle: fredokaregular.copyWith(
                          fontSize: 20, color: PetCareColor.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  SizedBox(
                    height: height / 56,
                  ),
                  TextField(
                    controller: authController.passwordController,
                    scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    obscureText: _obscureText,
                    cursorColor: PetCareColor.grey,
                    style: fredokaregular.copyWith(
                        fontSize: 20, color: PetCareColor.black),
                    decoration: InputDecoration(
                      hintText: 'Password'.tr,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: height / 36,
                        ),
                        onPressed: _togglePasswordStatus,
                        color: PetCareColor.iconcolor,
                      ),
                      filled: true,
                      fillColor: PetCareColor.textfield,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15),
                        child: SvgPicture.asset(PetCareSvgicons.lock,
                            height: height / 96),
                      ),
                      hintStyle: fredokaregular.copyWith(
                          fontSize: 20, color: PetCareColor.grey),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(
                    height: 36.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      authController.signUp(context);
                      // final auth = AuthenticationApi().signUp(
                      //   firstName: authController.nameController.text,
                      //   lastName: '',
                      //   email: authController.emailController.text,
                      //   password: authController.passwordController.text,
                      //   phoneNumber: authController.phoneController.text,
                      // );
                    },
                    child: Container(
                      height: height / 15,
                      width: width / 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PetCareColor.primary,
                      ),
                      child: Center(
                        child: authController.isLoading.value == true
                            ? const CircularProgressIndicator(
                                color: Colors.black)
                            : Text(
                                "Sign_Up".tr,
                                style: fredokamedium.copyWith(
                                    fontSize: 20, color: PetCareColor.white),
                              ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?  ".tr,
                        style: fredokaregular.copyWith(fontSize: 15),
                      ),
                      InkWell(
                        splashColor: PetCareColor.transparent,
                        highlightColor: PetCareColor.transparent,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const PetCareLogin();
                            },
                          ));
                        },
                        child: Text(
                          "Log in".tr,
                          style: fredokasemibold.copyWith(
                              fontSize: 15, color: PetCareColor.primary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/auth_controller.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/petcare_signup.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'package:pet_care/petcare/petcare_dashboard/petcare_dashboard.dart';

class PetCareLogin extends StatefulWidget {
  const PetCareLogin({super.key});

  @override
  State<PetCareLogin> createState() => _PetCareLoginState();
}

class _PetCareLoginState extends State<PetCareLogin> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());
  final authController = Get.put(AuthController());

  void _togglePasswordStatus() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureText = true;

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height / 36,
              ),
              Center(
                child: Image.asset(
                  PetCarePngimage.coco,
                  height: height / 6,
                ),
              ),
              SizedBox(
                height: height / 36,
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
                  )),
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
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        size: height / 36,
                      ),
                      onPressed: _togglePasswordStatus,
                      color: PetCareColor.iconcolor,
                    ),
                    filled: true,
                    fillColor: PetCareColor.textfield,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(15),
                      child: SvgPicture.asset(
                        PetCareSvgicons.lock,
                        height: height / 96,
                      ),
                    ),
                    hintStyle: fredokaregular.copyWith(
                        fontSize: 20, color: PetCareColor.grey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  )),
              SizedBox(
                height: height / 56,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     InkWell(
              //       splashColor: PetCareColor.transparent,
              //       highlightColor: PetCareColor.transparent,
              //       onTap: () {
              //         Navigator.push(context, MaterialPageRoute(
              //           builder: (context) {
              //             return const PetCareForgotPassword();
              //           },
              //         ));
              //       },
              //       child: Text(
              //         "Forgot_Password".tr,
              //         style: fredokaregular.copyWith(fontSize: 16.sp, color: PetCareColor.primary),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 48.h,
              ),

              InkWell(
                splashColor: PetCareColor.transparent,
                highlightColor: PetCareColor.transparent,
                onTap: () => authController.login(context),
                // () => Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //   return PetCareDashboard("0");
                // })),
                child: Container(
                  height: height / 15,
                  width: width / 1,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: PetCareColor.primary),
                  child: Center(
                    child: authController.isLoading.value == true
                        ? const CircularProgressIndicator(color: Colors.black)
                        : Text(
                            "Login".tr,
                            style: fredokamedium.copyWith(
                                fontSize: 20, color: PetCareColor.white),
                          ),
                  ),
                ),
              ),

              // Text(
              //   "or_connect_with".tr,
              //   style: fredokaregular.copyWith(
              //       fontSize: 25, color: PetCareColor.grey),
              // ),
              // const Spacer(),
              // Container(
              //   height: height / 15,
              //   width: width / 1,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: PetCareColor.primary),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: width / 7),
              //     child: Row(
              //       children: [
              //         Image.asset(
              //           PetCarePngimage.google,
              //           height: height / 30,
              //         ),
              //         SizedBox(
              //           width: width / 36,
              //         ),
              //         Text(
              //           "Login_with_Google".tr,
              //           style: fredokaregular.copyWith(
              //               fontSize: 20, color: PetCareColor.black),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: height / 56,
              // ),
              // Container(
              //   height: height / 15,
              //   width: width / 1,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: PetCareColor.primary),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: width / 7),
              //     child: Row(
              //       children: [
              //         Image.asset(
              //           PetCarePngimage.facebook,
              //           height: height / 30,
              //         ),
              //         SizedBox(
              //           width: width / 36,
              //         ),
              //         Text(
              //           "Login_with_Facebook".tr,
              //           style: fredokaregular.copyWith(
              //               fontSize: 20, color: PetCareColor.black),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: height / 56,
              // ),
              // Container(
              //   height: height / 15,
              //   width: width / 1,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: PetCareColor.primary),
              //   child: Padding(
              //     padding: EdgeInsets.symmetric(horizontal: width / 7),
              //     child: Row(
              //       children: [
              //         Image.asset(
              //           PetCarePngimage.apple,
              //           height: height / 30,
              //         ),
              //         SizedBox(
              //           width: width / 36,
              //         ),
              //         Text(
              //           "Login_with_Apple".tr,
              //           style: fredokaregular.copyWith(
              //               fontSize: 20, color: PetCareColor.black),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: height / 56,
              // ),

              SizedBox(height: 20.sp),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Dont_have_an_account".tr,
                    style: fredokaregular.copyWith(fontSize: 15),
                  ),
                  InkWell(
                    splashColor: PetCareColor.transparent,
                    highlightColor: PetCareColor.transparent,
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const PetCareSignUp();
                        },
                      ));
                    },
                    child: Text(
                      "Sign_Up".tr,
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
    );
  }
}

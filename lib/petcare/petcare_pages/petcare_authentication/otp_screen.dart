import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/auth_controller.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Obx(
      () => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
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
              SizedBox(height: height / 30),
              Text(
                'Code has been sent to your email.',
                style: fredokaregular.copyWith(fontSize: 18.sp),
              ),
              SizedBox(height: height / 30),
              const OTPField2(),
              SizedBox(height: height / 56),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Haven\'t received the verification code?',
                    style: fredokaregular.copyWith(fontSize: 16.sp),
                  ),
                  const SizedBox(height: 10),
                  InkWell(
                    splashColor: PetCareColor.transparent,
                    highlightColor: PetCareColor.transparent,
                    onTap: () => authController.resendOTP(context),
                    child: Text(
                      'Resend',
                      style: fredokasemibold.copyWith(
                        fontSize: 18.sp,
                        color: PetCareColor.primary,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 48.h,
              ),
              InkWell(
                splashColor: PetCareColor.transparent,
                highlightColor: PetCareColor.transparent,
                onTap: () {
                  authController.verifyOTP(context);
                },
                child: Container(
                  height: height / 15,
                  width: width / 1,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: PetCareColor.primary),
                  child: Center(
                    child: authController.isLoading.value == true
                        ? const CircularProgressIndicator(color: Colors.black)
                        : Text(
                            'Verify',
                            style: fredokamedium.copyWith(fontSize: 20, color: PetCareColor.black),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OTPField2 extends StatefulWidget {
  const OTPField2({Key? key}) : super(key: key);

  @override
  State<OTPField2> createState() => _OTPField2State();
}

class _OTPField2State extends State<OTPField2> {
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w),
      child: PinCodeTextField(
        autoFocus: true,
        controller: authController.otpController,
        appContext: context,
        length: 6,
        keyboardType: TextInputType.number,
        obscureText: false,
        cursorColor: Theme.of(context).primaryColor,
        animationType: AnimationType.fade,
        textStyle: const TextStyle(
          fontFamily: "FredokaRegular",
          fontSize: 18,
          color: Colors.black,
        ),
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(4),
          fieldHeight: 50,
          fieldWidth: 45,
          activeFillColor: Colors.white,
          inactiveColor: Colors.grey,
          selectedColor: PetCareColor.primary,
          activeColor: PetCareColor.primary,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: false,
        onCompleted: (val) {
          authController.otpController.text = val;
        },
        onChanged: (val) {
          authController.otpController.text = val;
        },
        beforeTextPaste: (text) {
          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
          //but you can show anything you want here, like your pop up saying wrong paste format or etc
          return true;
        },
      ),
    );
  }
}

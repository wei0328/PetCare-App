import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/petcare_login.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/petcare_signup.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareOnBording2 extends StatefulWidget {
  const PetCareOnBording2({super.key});

  @override
  State<PetCareOnBording2> createState() => _PetCareOnBording2State();
}

class _PetCareOnBording2State extends State<PetCareOnBording2> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            PetCarePngimage.onbording2,
            width: width / 1,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: width / 1,
                decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(26), topLeft: Radius.circular(26)), color: PetCareColor.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 26),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height / 56,
                      ),
                      Text(
                        "We provide",
                        style: fredokasemibold.copyWith(fontSize: 32, color: PetCareColor.black),
                      ),
                      SizedBox(
                        height: height / 96,
                      ),
                      Text(
                        "24hrs location tracking & health\nupdates",
                        textAlign: TextAlign.center,
                        style: fredokamedium.copyWith(fontSize: 20, color: PetCareColor.grey),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Text(
                        "On time feeding\nupdates",
                        textAlign: TextAlign.center,
                        style: fredokamedium.copyWith(fontSize: 20, color: PetCareColor.grey),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Container(
                        height: height / 15,
                        width: width / 1,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: PetCareColor.primary),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 36),
                          child: Row(
                            children: [
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
                                child: SizedBox(
                                  width: width / 1.27,
                                  child: Center(
                                    child: Text(
                                      "Get_Started".tr,
                                      style: fredokabold.copyWith(fontSize: 20, color: PetCareColor.white),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Icon(
                                Icons.chevron_right,
                                size: height / 30,
                                color: PetCareColor.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already_have_an_account".tr,
                            style: fredokasemibold.copyWith(fontSize: 15, color: PetCareColor.black),
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
                              "Login".tr,
                              style: fredokasemibold.copyWith(fontSize: 15, color: PetCareColor.primary),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

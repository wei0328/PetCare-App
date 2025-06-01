import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/petcare_onboarding2.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareOnBording1 extends StatefulWidget {
  const PetCareOnBording1({super.key});

  @override
  State<PetCareOnBording1> createState() => _PetCareOnBording1State();
}

class _PetCareOnBording1State extends State<PetCareOnBording1> {
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
            PetCarePngimage.onbording1,
            width: width / 1,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: width / 1,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(26),
                        topLeft: Radius.circular(26)),
                    color: PetCareColor.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 36, vertical: height / 16),
                  child: Column(
                    children: [
                      Text(
                        "Now !",
                        style: fredokasemibold.copyWith(fontSize: 32, color: PetCareColor.black),
                      ),
                      SizedBox(
                        height: height / 96,
                      ),
                      Text(
                        "One tap for foods, accessories, health\ncare products & digital gadgets",
                        textAlign: TextAlign.center,
                        style: fredokamedium.copyWith(
                            fontSize: 20, color: PetCareColor.grey),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Text(
                        "Grooming & boarding",
                        textAlign: TextAlign.center,
                        style: fredokamedium.copyWith(
                            fontSize: 20, color: PetCareColor.grey),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      Text(
                        "Easy & best consultation bookings",
                        textAlign: TextAlign.center,
                        style: fredokamedium.copyWith(
                            fontSize: 20, color: PetCareColor.grey),
                      ),
                      SizedBox(
                        height: height / 36,
                      ),
                      InkWell(
                        splashColor: PetCareColor.transparent,
                        highlightColor: PetCareColor.transparent,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const PetCareOnBording2();
                            },
                          ));
                        },
                        child: Container(
                          height: height / 15,
                          width: width / 1,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: PetCareColor.primary),
                          child: Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width / 36),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width / 1.27,
                                  child: Center(
                                    child: Text(
                                      "Next".tr,
                                      style: fredokabold.copyWith(
                                          fontSize: 20,
                                          color: PetCareColor.white),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareForgotPassword extends StatefulWidget {
  const PetCareForgotPassword({super.key});

  @override
  State<PetCareForgotPassword> createState() => _PetCareForgotPasswordState();
}

class _PetCareForgotPasswordState extends State<PetCareForgotPassword> {
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                cursorColor: PetCareColor.grey,
                style: fredokaregular.copyWith(fontSize: 20, color: PetCareColor.black),
                decoration: InputDecoration(
                  hintText: 'Email'.tr,
                  filled: true,
                  fillColor: PetCareColor.textfield,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15),
                    child: SvgPicture.asset(PetCareSvgicons.mail, height: height / 96),
                  ),
                  hintStyle: fredokaregular.copyWith(fontSize: 20, color: PetCareColor.grey),
                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                )),
            SizedBox(
              height: height / 56,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  splashColor: PetCareColor.transparent,
                  highlightColor: PetCareColor.transparent,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const PetCareForgotPassword();
                      },
                    ));
                  },
                  child: Text(
                    "Resend_Code".tr,
                    style: fredokaregular.copyWith(fontSize: 20, color: PetCareColor.primary),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 16,
            ),
            Container(
              height: height / 15,
              width: width / 1,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: PetCareColor.primary),
              child: Center(
                child: Text(
                  "Send".tr,
                  style: fredokaregular.copyWith(fontSize: 20, color: PetCareColor.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

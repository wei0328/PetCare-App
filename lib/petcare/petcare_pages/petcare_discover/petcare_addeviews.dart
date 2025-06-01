import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareAddReviews extends StatefulWidget {
  const PetCareAddReviews({super.key});

  @override
  State<PetCareAddReviews> createState() => _PetCareAddReviewsState();
}

class _PetCareAddReviewsState extends State<PetCareAddReviews> {
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
      appBar: AppBar(
        leading: InkWell(
            splashColor: PetCareColor.transparent,
            highlightColor: PetCareColor.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.chevron_left,
              size: height / 30,
              color: PetCareColor.white,
            )),
        backgroundColor: PetCareColor.primary,
        centerTitle: true,
        title: Text(
          "Add Review".tr,
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width / 36, vertical: height / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  PetCarePngimage.profile1,
                  height: height / 16,
                ),
                SizedBox(
                  width: width / 36,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Haylie Aminoff",
                      style: fredokasemibold.copyWith(
                          fontSize: 15),
                    ),
                    SizedBox(height: height / 200),
                    Text(
                      "Just now",
                      style: fredokamedium.copyWith(
                          fontSize: 10,
                          color: PetCareColor.grey),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: height/36),
            Center(
              child: Image.asset(
                PetCarePngimage.star,
                width: width / 2,
              ),
            ),
            SizedBox(height: height/36),
            Text(
              "Share more about your experience".tr,
              style: fredokamedium.copyWith(
                  fontSize: 15),
            ),
            SizedBox(height: height/36),
            TextField(
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                cursorColor: PetCareColor.grey,
                maxLines: 5,
                style: fredokaregular.copyWith(
                    fontSize: 12, color: PetCareColor.black),
                decoration: InputDecoration(
                  hintText: 'Share details of your own experience at this place'.tr,
                  filled: true,
                  fillColor: PetCareColor.textfield,
                  hintStyle: fredokaregular.copyWith(
                      fontSize: 12, color: PetCareColor.grey),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                )),
            SizedBox(height: height/16),
            Container(
              height: height / 15,
              width: width / 1,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: PetCareColor.primary),
              child: Center(
                child: Text(
                  "Post Review".tr,
                  style: fredokamedium.copyWith(
                      fontSize: 15,
                      color: PetCareColor.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

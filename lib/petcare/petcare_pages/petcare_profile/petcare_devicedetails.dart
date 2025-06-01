import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareDeviceDetails extends StatefulWidget {
  const PetCareDeviceDetails({super.key});

  @override
  State<PetCareDeviceDetails> createState() => _PetCareDeviceDetailsState();
}

class _PetCareDeviceDetailsState extends State<PetCareDeviceDetails> {
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
          "Device Details".tr,
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              PetCarePngimage.blurremovebg,
              height: height / 3,
              width: width / 1,
              fit: BoxFit.fitWidth,
            ),
            Container(
              height: height / 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(blurRadius: 5, color: PetCareColor.iconcolor)
                  ],
                  color: PetCareColor.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Fi Smart Collar",
                      style: fredokabold.copyWith(fontSize: 18.27, color: PetCareColor.black),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: PetCareColor.purple)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width / 36, vertical: height / 500),
                        child: Text(
                          "Blacky",
                          style: fredokaregular.copyWith(
                              fontSize: 7, color: PetCareColor.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 56,
            ),
            Container(
              height: height / 15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(blurRadius: 5, color: PetCareColor.iconcolor)
                  ],
                  color: PetCareColor.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 36),
                child: Row(
                  children: [
                    Text(
                      "Connected",
                      style: fredokamedium.copyWith(fontSize: 14, color: PetCareColor.black),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(
                          PetCareSvgicons.battery,
                          height: height / 36,
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        Text(
                          "46 %",
                          style: fredokaregular.copyWith(fontSize: 12.51, color: PetCareColor.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 56,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(blurRadius: 5, color: PetCareColor.iconcolor)
                  ],
                  color: PetCareColor.white),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height / 96),
                    Row(
                      children: [
                        SvgPicture.asset(
                          PetCareSvgicons.happy,
                          height: height / 36,
                        ),
                        SizedBox(width: width / 56),
                        Text(
                          "Pet Status",
                          style: fredokabold.copyWith(fontSize: 19.7, color: PetCareColor.black),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          PetCarePngimage.pet1,
                          height: height / 14,
                        ),
                        Image.asset(
                          PetCarePngimage.petmap,
                          height: height / 8,
                          width: width / 1.5,
                        ),
                      ],
                    ),
                    SizedBox(height: height / 96),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

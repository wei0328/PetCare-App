import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/petcare_devicedetails.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareDevices extends StatefulWidget {
  const PetCareDevices({super.key});

  @override
  State<PetCareDevices> createState() => _PetCareDevicesState();
}

class _PetCareDevicesState extends State<PetCareDevices> {
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
          "Devices".tr,
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
            InkWell(
              splashColor: PetCareColor.transparent,
              highlightColor: PetCareColor.transparent,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const PetCareDeviceDetails();
                  },
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: PetCareColor.textfield),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 36, vertical: height / 96),
                  child: Row(
                    children: [
                      Image.asset(
                        PetCarePngimage.device6,
                        height: height / 12,
                        width: width / 6,
                      ),
                      SizedBox(
                        width: width / 36,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Fi Smart Collar",
                            style: fredokasemibold.copyWith(
                                fontSize: 12, color: PetCareColor.black),
                          ),
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
                                style: fredokaregular.copyWith(fontSize: 12.51),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 56,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width / 2.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: PetCareColor.textfield),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 36, vertical: height / 56),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Activity Tracker",
                          style: fredokaregular.copyWith(fontSize: 14.51),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        SvgPicture.asset(
                          PetCareSvgicons.tracker,
                          height: height / 36,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width / 2.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: PetCareColor.textfield),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 36, vertical: height / 56),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sleep Monitor",
                          style: fredokaregular.copyWith(fontSize: 14.51),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        SvgPicture.asset(
                          PetCareSvgicons.sleepmonitor,
                          height: height / 36,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 96,
            ),
            const Divider(
              color: PetCareColor.black,
            ),
            SizedBox(
              height: height / 96,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: PetCareColor.textfield),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 36, vertical: height / 96),
                child: Row(
                  children: [
                    Image.asset(
                      PetCarePngimage.device3,
                      height: height / 12,
                      width: width / 6,
                    ),
                    SizedBox(
                      width: width / 36,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Petcube Pet Camera",
                          style: fredokasemibold.copyWith(
                              fontSize: 12, color: PetCareColor.black),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              PetCareSvgicons.connected,
                              height: height / 36,
                            ),
                            SizedBox(
                              width: width / 36,
                            ),
                            Text(
                              "Connected",
                              style: fredokaregular.copyWith(fontSize: 12.51),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height / 56,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width / 2.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: PetCareColor.textfield),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 36, vertical: height / 56),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Disconnect",
                          style: fredokaregular.copyWith(fontSize: 14.51),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        SvgPicture.asset(
                          PetCareSvgicons.disconnect,
                          height: height / 36,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: width / 2.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: PetCareColor.textfield),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 36, vertical: height / 56),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Stream",
                          style: fredokaregular.copyWith(fontSize: 14.51),
                        ),
                        SizedBox(
                          width: width / 36,
                        ),
                        SvgPicture.asset(
                          PetCareSvgicons.stream,
                          height: height / 36,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height / 10,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: PetCareColor.textfield),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width/16,vertical: height/96),
                  child: Text(
                    "ADD DEVICES",
                    style: fredokasemibold.copyWith(
                        fontSize: 15, color: PetCareColor.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height / 36,
            ),
            Text(
              "EXPLORE".tr,
              style: fredokasemibold.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: height / 56,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: PetCareColor.textfield),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width / 36, vertical: height / 96),
                child: Row(
                  children: [
                    Image.asset(
                      PetCarePngimage.dog1,
                      height: height / 12,
                      width: width / 6,
                    ),
                    SizedBox(
                      width: width / 36,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tips",
                          style: fredokasemibold.copyWith(fontSize: 16),
                        ),
                        SizedBox(
                          height: height / 200,
                        ),
                        Text(
                          "Get Strated with your Fi Smart Collar",
                          style: fredokasemibold.copyWith(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/petcare_devices.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareAddDevice extends StatefulWidget {
  const PetCareAddDevice({super.key});

  @override
  State<PetCareAddDevice> createState() => _PetCareAddDeviceState();
}

class _PetCareAddDeviceState extends State<PetCareAddDevice> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());

  List img = [
    PetCarePngimage.device6,
    PetCarePngimage.device1,
    PetCarePngimage.device2,
    PetCarePngimage.device3,
    PetCarePngimage.device4,
    PetCarePngimage.device5,
  ];
  List title = [
    "Smart Collar",
    "Pet Feeder",
    "GPS Tracker",
    "Pet Camera",
    "Petcube Play",
    "Petcube bites"
  ];

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
          "Add Device".tr,
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: PetCareColor.primary),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width / 16, vertical: height / 96),
                      child: Text(
                        "Scan Device".tr,
                        style: fredokamedium.copyWith(
                            fontSize: 20, color: PetCareColor.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height / 56,
              ),
              Text(
                "Select Device".tr,
                style: fredokamedium.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: height / 56,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: img.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: height / 56),
                    child: InkWell(
                      splashColor: PetCareColor.transparent,
                      highlightColor: PetCareColor.transparent,
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const PetCareDevices();
                          },
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: PetCareColor.textfield),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: width / 36,vertical: height/96),
                          child: Row(
                            children: [
                              Image.asset(
                                img[index],
                                height: height / 12,
                                width: width / 6,
                              ),
                              SizedBox(
                                width: width / 36,
                              ),
                              Text(
                                title[index],
                                style: fredokasemibold.copyWith(fontSize: 15),
                              ),
                              const Spacer(),
                              SvgPicture.asset(
                                PetCareSvgicons.link,
                                height: height / 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

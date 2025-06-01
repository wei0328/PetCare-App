import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareRetailStores extends StatefulWidget {
  const PetCareRetailStores({super.key});

  @override
  State<PetCareRetailStores> createState() => _PetCareRetailStoresState();
}

class _PetCareRetailStoresState extends State<PetCareRetailStores> {
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
          "Find_Retail_Stores".tr,
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
        ),
        actions: [
          SvgPicture.asset(
            PetCareSvgicons.cart,
            height: height / 30,
          ),
          SizedBox(
            width: width / 56,
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            PetCarePngimage.map1,
            height: height / 1,
            width: width / 1,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
              left: 18,
              right: 18,
              bottom: 20,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: PetCareColor.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 26, vertical: height / 56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Keels Pet Foods",
                        style: fredokasemibold.copyWith(fontSize: 19.7, color: PetCareColor.black),
                      ),
                      SizedBox(
                        height: height / 96,
                      ),
                      Row(
                        children: [
                          Text(
                            "5.0 ",
                            style: fredokamedium.copyWith(fontSize: 12, color: PetCareColor.black),
                          ),
                          Image.asset(
                            PetCarePngimage.rating,
                            width: width / 4,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 96,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            PetCareSvgicons.location,
                            height: height / 36,
                          ),
                          Text(
                            " 700 m away from you",
                            style: fredokaregular.copyWith(
                                fontSize: 15.32, color: PetCareColor.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 96,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: height / 20,
                            width: width / 4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: PetCareColor.primary),
                            child: Center(
                              child: Text(
                                "Call_Now".tr,
                                style: fredokamedium.copyWith(
                                    fontSize: 10, color: PetCareColor.white),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

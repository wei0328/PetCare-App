import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_explore/petcare_notification.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_explore/petcare_retailstores.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareExplore extends StatefulWidget {
  const PetCareExplore({super.key});

  @override
  State<PetCareExplore> createState() => _PetCareExploreState();
}

class _PetCareExploreState extends State<PetCareExplore> {
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
        leading: Container(),
        backgroundColor: PetCareColor.primary,
        centerTitle: true,
        title: Text(
          "Track_Your_Pet".tr,
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
        ),
        actions: [
          InkWell(
            splashColor: PetCareColor.transparent,
            highlightColor: PetCareColor.transparent,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const PetCareNotification();
                },
              ));
            },
            child: SvgPicture.asset(
              PetCareSvgicons.notification,
              height: height / 26,
            ),
          ),
          SizedBox(
            width: width / 56,
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            PetCarePngimage.map,
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
                      Row(
                        children: [
                          Text(
                            "Bella ",
                            style: fredokasemibold.copyWith(fontSize: 19.7),
                          ),
                          Text(
                            "- Border Collie",
                            style: fredokasemibold.copyWith(
                                fontSize: 19.7, color: PetCareColor.darkgreen),
                          ),
                          const Spacer(),
                          Container(
                            height: height / 20,
                            width: height / 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: PetCareColor.pink),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                PetCareSvgicons.woman,
                                height: height / 36,
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            PetCareSvgicons.location,
                            height: height / 36,
                          ),
                          Text(
                            " 1,2 km away from you",
                            style: fredokaregular.copyWith(
                                fontSize: 15.32, color: PetCareColor.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height / 56,
                      ),
                      Row(
                        children: [
                          Container(
                            height: height / 20,
                            width: height / 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: PetCareColor.red),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                PetCarePngimage.heart,
                                height: height / 36,
                              ),
                            ),
                          ),
                          SizedBox(width: width / 36),
                          Container(
                            height: height / 20,
                            width: height / 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: PetCareColor.primary),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                PetCareSvgicons.food,
                                height: height / 36,
                              ),
                            ),
                          ),
                          SizedBox(width: width / 36),
                          Container(
                            height: height / 20,
                            width: height / 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: PetCareColor.red),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                PetCarePngimage.feedback,
                                height: height / 36,
                              ),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            splashColor: PetCareColor.transparent,
                            highlightColor: PetCareColor.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const PetCareRetailStores();
                                },
                              ));
                            },
                            child: Container(
                              height: height / 20,
                              width: width / 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: PetCareColor.primary),
                              child: Center(
                                child: Text(
                                  "See_More".tr,
                                  style: fredokamedium.copyWith(
                                      fontSize: 10, color: PetCareColor.white),
                                ),
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

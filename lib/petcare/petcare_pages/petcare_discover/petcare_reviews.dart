import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_discover/petcare_addeviews.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareReviews extends StatefulWidget {
  const PetCareReviews({super.key});

  @override
  State<PetCareReviews> createState() => _PetCareReviewsState();
}

class _PetCareReviewsState extends State<PetCareReviews> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());

  List img = [
    PetCarePngimage.profile1,
    PetCarePngimage.profile2,
    PetCarePngimage.profile3
  ];
  List title = ["Haylie Aminoff", "Carla Septimus", "Carla George"];
  List time = ["Just now", "32 minutes ago", "2 days ago"];
  List desc = [
    "The thing I like best about COCO is the amount of time it\nhas saved while trying to manage my three pets. ",
    "Lorem ipsum dolor sit amet, consetetur sadi sspscing\nelitr, sed diam nonumy",
    "Lorem ipsum dolor sit amet, consetetur sadi sspscing\nelitr, sed diam nonumy"
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
          "Reviews".tr,
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center ,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.add_box_rounded,
                    size: height / 30,
                    color: themedata.isdark ? PetCareColor.white : PetCareColor.black,
                  ),
                ],
              ),
              Text(
                "4.5".tr,
                style: fredokabold.copyWith(fontSize: 51),
              ),
              Image.asset(
                PetCarePngimage.rating5,
                width: width / 4,
              ),
              SizedBox(
                height: height / 200,
              ),
              Text(
                "Based on 89 reviews".tr,
                style: fredokamedium.copyWith(
                    fontSize: 12, color: PetCareColor.grey),
              ),
              SizedBox(
                height: height / 36,
              ),
              Image.asset(
                PetCarePngimage.review,
                width: width / 1,
              ),
              SizedBox(
                height: height / 36,
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
                            return const PetCareAddReviews();
                          },
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5, color: PetCareColor.iconcolor)
                            ],
                            color: PetCareColor.white),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: width / 36, vertical: height / 56),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    img[index],
                                    height: height / 16,
                                  ),
                                  SizedBox(
                                    width: width / 36,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title[index],
                                        style: fredokasemibold.copyWith(
                                            fontSize: 15, color: PetCareColor.black),
                                      ),
                                      SizedBox(height: height / 200),
                                      Text(
                                        time[index],
                                        style: fredokamedium.copyWith(
                                            fontSize: 10,
                                            color: PetCareColor.grey),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: height / 96,
                              ),
                              const Divider(color: PetCareColor.grey),
                              SizedBox(
                                height: height / 96,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "4.5 ".tr,
                                    style: fredokamedium.copyWith(fontSize: 12, color: PetCareColor.black),
                                  ),
                                  Image.asset(
                                    PetCarePngimage.rating5,
                                    width: width / 4,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height / 120,
                              ),
                              Text(
                                desc[index],
                                style: fredokaregular.copyWith(
                                    fontSize: 12, color: PetCareColor.grey),
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

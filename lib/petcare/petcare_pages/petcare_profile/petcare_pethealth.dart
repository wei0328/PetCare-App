import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCarePetHealth extends StatefulWidget {
  const PetCarePetHealth({super.key});

  @override
  State<PetCarePetHealth> createState() => _PetCarePetHealthState();
}

class _PetCarePetHealthState extends State<PetCarePetHealth> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          bottom: TabBar(
              unselectedLabelStyle: fredokamedium.copyWith(
                  fontSize: 20, color: PetCareColor.white),
              labelStyle: fredokamedium.copyWith(
                  fontSize: 20, color: PetCareColor.white),
              isScrollable: true,
              labelPadding: EdgeInsets.symmetric(horizontal: width / 12),
              indicatorPadding: EdgeInsets.only(bottom: height / 120),
              labelColor: PetCareColor.white,
              indicatorColor: PetCareColor.white,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(text: "Wellness"),
                Tab(text: "Medical Records"),
              ]),
        ),
        body: TabBarView(children: [
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 36, vertical: height / 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                              Text(
                                "Vaccinations",
                                style: fredokabold.copyWith(fontSize: 25, color: PetCareColor.black),
                              ),
                              const Spacer(),
                              Text(
                                "See all",
                                style: fredokamedium.copyWith(
                                    fontSize: 16,
                                    color: PetCareColor.darkgreen),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: height / 36,
                                color: PetCareColor.darkgreen,
                              )
                            ],
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
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: PetCareColor.iconcolor)
                                    ],
                                    color: PetCareColor.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 36,
                                      vertical: height / 56),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Rabies vaccination",
                                        style:
                                            fredokabold.copyWith(fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "24th Jan 2022",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Dr. Nambuvan",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width / 2.6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: PetCareColor.iconcolor)
                                    ],
                                    color: PetCareColor.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 36,
                                      vertical: height / 56),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Calicivirus",
                                        style:
                                            fredokabold.copyWith(fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "12nd Feb 2022",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Dr. Raam",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 36,
                  ),
                  Container(
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
                        children: [
                          Row(
                            children: [
                              Text(
                                "Allergies",
                                style: fredokabold.copyWith(fontSize: 25, color: PetCareColor.black),
                              ),
                              const Spacer(),
                              Text(
                                "See all",
                                style: fredokamedium.copyWith(
                                    fontSize: 16,
                                    color: PetCareColor.darkgreen),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: height / 36,
                                color: PetCareColor.darkgreen,
                              )
                            ],
                          ),
                          SizedBox(
                            height: height / 56,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Skin Allergies",
                                    style: fredokabold.copyWith(fontSize: 14, color: PetCareColor.black),
                                  ),
                                  Text(
                                    "May be accompanied by\ngastrointestinal symptoms.",
                                    textAlign: TextAlign.center,
                                    style:
                                        fredokaregular.copyWith(fontSize: 12, color: PetCareColor.black),
                                  ),
                                  Text(
                                    "Dr. Jerry",
                                    style:
                                        fredokaregular.copyWith(fontSize: 15, color: PetCareColor.black),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Food Allergies",
                                    style: fredokabold.copyWith(fontSize: 14, color: PetCareColor.black),
                                  ),
                                  Text(
                                    "Vomiting and diarrhea,\nor dermatologic signs.",
                                    textAlign: TextAlign.center,
                                    style:
                                        fredokaregular.copyWith(fontSize: 12, color: PetCareColor.black),
                                  ),
                                  Text(
                                    "Dr. Klein",
                                    style:
                                        fredokaregular.copyWith(fontSize: 15, color: PetCareColor.black),
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
                    height: height / 36,
                  ),
                  Container(
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
                        children: [
                          Row(
                            children: [
                              Text(
                                "Appointments",
                                style: fredokabold.copyWith(fontSize: 25, color: PetCareColor.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 200,
                          ),
                          Text(
                            "When you schedule an appointment.\nyou’ll see it here. Let’s set your first\nappointment.",
                            style: fredokamedium.copyWith(fontSize: 18, color: PetCareColor.black),
                          ),
                          SizedBox(
                            height: height / 96,
                          ),
                          Container(
                            width: width / 3.5,
                            height: height / 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: PetCareColor.primary),
                            child: Center(
                              child: Text(
                                "Start",
                                style: fredokasemibold.copyWith(
                                    fontSize: 18, color: PetCareColor.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 36, vertical: height / 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                              Text(
                                "Past vaccinations",
                                style: fredokabold.copyWith(fontSize: 25, color: PetCareColor.black),
                              ),
                              const Spacer(),
                              Text(
                                "See all",
                                style: fredokamedium.copyWith(
                                    fontSize: 16,
                                    color: PetCareColor.darkgreen),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: height / 36,
                                color: PetCareColor.darkgreen,
                              )
                            ],
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
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: PetCareColor.iconcolor)
                                    ],
                                    color: PetCareColor.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 36,
                                      vertical: height / 56),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Rabies vaccination",
                                        style:
                                            fredokabold.copyWith(fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Mon 24 Jan",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Dr. Green",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width / 2.6,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: PetCareColor.iconcolor)
                                    ],
                                    color: PetCareColor.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 36,
                                      vertical: height / 56),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Calicivirus",
                                        style:
                                            fredokabold.copyWith(fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Tue 12 Feb",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Dr. Raam",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 36,
                  ),
                  Container(
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
                          Text(
                            "Past Treatements",
                            style: fredokabold.copyWith(fontSize: 25, color: PetCareColor.black),
                          ),
                          SizedBox(
                            height: height / 56,
                          ),
                          Text(
                            "Allergies",
                            style: fredokabold.copyWith(fontSize: 20, color: PetCareColor.black),
                          ),
                          SizedBox(
                            height: height / 56,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: width / 2.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: PetCareColor.iconcolor)
                                    ],
                                    color: PetCareColor.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 36,
                                      vertical: height / 56),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Skin Allergies",
                                        style:
                                            fredokabold.copyWith(fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Wed 13 Mar",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Dr. Jerry ",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width / 2.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: PetCareColor.iconcolor)
                                    ],
                                    color: PetCareColor.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 36,
                                      vertical: height / 56),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Food Allergies",
                                        style:
                                            fredokabold.copyWith(fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Thu 14 Apr",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Dr. Klein ",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: height / 26,
                                color: PetCareColor.black,
                              )
                            ],
                          ),
                          SizedBox(
                            height: height / 36,
                          ),
                          Text(
                            "Cough",
                            style: fredokabold.copyWith(fontSize: 20, color: PetCareColor.black),
                          ),
                          SizedBox(
                            height: height / 56,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: width / 2.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: PetCareColor.iconcolor)
                                    ],
                                    color: PetCareColor.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 36,
                                      vertical: height / 56),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Kennel Cough",
                                        style:
                                            fredokabold.copyWith(fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Wed 15 May",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Dr. Berry",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width / 2.7,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: const [
                                      BoxShadow(
                                          blurRadius: 5,
                                          color: PetCareColor.iconcolor)
                                    ],
                                    color: PetCareColor.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width / 36,
                                      vertical: height / 56),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Canine Cough",
                                        style:
                                            fredokabold.copyWith(fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Wed 16 Jun",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                      Text(
                                        "Dr. Belmin",
                                        style: fredokaregular.copyWith(
                                            fontSize: 14, color: PetCareColor.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: height / 26,
                                color: PetCareColor.black,
                              )
                            ],
                          ),
                          SizedBox(
                            height: height / 36,
                          ),
                          Center(
                            child: Text(
                              "See all",
                              style: fredokamedium.copyWith(
                                  fontSize: 16, color: PetCareColor.darkgreen),
                            ),
                          ),
                          Center(
                              child: SvgPicture.asset(
                            PetCareSvgicons.bottomearo,
                            height: height / 26,
                          ))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}

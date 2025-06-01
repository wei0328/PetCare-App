import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/petcare_pethealth.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/petcare_pet.dart';

class PetCarePet extends StatefulWidget {
  //const PetCarePet({super.key});
  final String petName;
  final String petBreed;
  final String petGender;
  final String petWeight;
  final String petHeight;
  final String petAge;
  final String petColor;

  const PetCarePet(
      {required this.petName,
      required this.petBreed,
      required this.petGender,
      required this.petWeight,
      required this.petHeight,
      required this.petAge,
      required this.petColor});

  @override
  State<PetCarePet> createState() => _PetCarePetState();
}

class _PetCarePetState extends State<PetCarePet> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());

  List title = ["Age", "Weight", "Height", "Color"];
  List subtitle = ["1y 4m 11d", "7,5 kg", "54 cm", "Black"];

  List title1 = ["Health", "Food", "Mood"];
  List subtitle1 = ["Abnormal", "Hungry", "Abnormal"];
  List time1 = [
    "Last Vaccinated (2mon Ago)",
    "Last Fed (1h Ago)",
    "Last Fed (1h Ago)"
  ];
  List btn1 = ["Contact Vet", "Check food", "Whistle"];
  List btncolor = [PetCareColor.red, PetCareColor.primary, PetCareColor.red];
  List img1 = [
    PetCarePngimage.heart,
    PetCarePngimage.petfood,
    PetCarePngimage.feedback
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
          "Pet".tr,
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              PetCarePngimage.dog2,
              height: height / 3,
              width: width / 1,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 36, vertical: height / 36),
              child: Column(
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bella",
                                style: fredokabold.copyWith(
                                    fontSize: 26.27, color: PetCareColor.black),
                              ),
                              Text(
                                "Border Collie",
                                style: fredokamedium.copyWith(
                                    fontSize: 17.51,
                                    color: PetCareColor.darkgreen),
                              ),
                            ],
                          ),
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
                    ),
                  ),
                  SizedBox(
                    height: height / 36,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        PetCareSvgicons.pet,
                        height: height / 36,
                        color: themedata.isdark
                            ? PetCareColor.white
                            : PetCareColor.black,
                      ),
                      SizedBox(width: width / 36),
                      Text(
                        "About Bella",
                        style: fredokabold.copyWith(fontSize: 19.7),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 56,
                  ),
                  SizedBox(
                    height: height / 13,
                    child: ListView.builder(
                      itemCount: title.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: width / 36),
                          child: Container(
                            width: width / 4.65,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: PetCareColor.lightprimary),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  title[index],
                                  style: fredokaregular.copyWith(
                                      fontSize: 16, color: PetCareColor.grey),
                                ),
                                Text(
                                  subtitle[index],
                                  style: fredokasemibold.copyWith(
                                      fontSize: 16,
                                      color: PetCareColor.darkgreen),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height / 56,
                  ),
                  Text(
                    "My first dog which was gifted by my mother for my 20th birthday.",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: fredokaregular.copyWith(fontSize: 16),
                  ),
                  SizedBox(
                    height: height / 26,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        PetCarePngimage.smileys,
                        height: height / 36,
                        color: themedata.isdark
                            ? PetCareColor.white
                            : PetCareColor.black,
                      ),
                      SizedBox(width: width / 36),
                      Text(
                        "Bella’s Status",
                        style: fredokabold.copyWith(fontSize: 19.7),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height / 56,
                  ),
                  ListView.builder(
                    itemCount: title1.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: height / 56),
                        child: InkWell(
                          splashColor: PetCareColor.transparent,
                          highlightColor: PetCareColor.transparent,
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return const PetCarePetHealth();
                              },
                            ));
                          },
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 22,
                                backgroundColor: btncolor[index],
                                child: Image.asset(
                                  img1[index],
                                  height: height / 36,
                                ),
                              ),
                              SizedBox(
                                width: width / 36,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title1[index],
                                    style: fredokamedium.copyWith(fontSize: 10),
                                  ),
                                  Text(
                                    subtitle1[index],
                                    style: fredokaregular.copyWith(
                                        fontSize: 10, color: PetCareColor.grey),
                                  ),
                                  Text(
                                    time1[index],
                                    style: fredokasemibold.copyWith(
                                        fontSize: 8,
                                        color: PetCareColor.primary),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Center(
                                child: Container(
                                  width: width / 3.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: btncolor[index]),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height / 116),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          btn1[index],
                                          style: fredokaregular.copyWith(
                                              fontSize: 12,
                                              color: PetCareColor.white),
                                        ),
                                        Icon(
                                          Icons.chevron_right,
                                          size: height / 36,
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
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

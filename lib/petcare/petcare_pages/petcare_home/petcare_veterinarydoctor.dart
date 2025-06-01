import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_home/petcare_bookappoinment.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareVeterinaryDoctor extends StatefulWidget {
  const PetCareVeterinaryDoctor({super.key});

  @override
  State<PetCareVeterinaryDoctor> createState() =>
      _PetCareVeterinaryDoctorState();
}

class _PetCareVeterinaryDoctorState extends State<PetCareVeterinaryDoctor> {
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
          "Dr.Nambuvan".tr,
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            PetCarePngimage.banner,
            height: height / 3,
            width: width / 1,
            fit: BoxFit.fitWidth,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 36, vertical: height / 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(blurRadius: 5, color: PetCareColor.iconcolor)
                      ],
                      color: PetCareColor.white),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width / 36, vertical: height / 56),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dr. Nambuvan",
                          style: fredokabold.copyWith(
                              fontSize: 26.27, color: PetCareColor.black),
                        ),
                        Text(
                          "Bachelor of veterinary science ",
                          style: fredokamedium.copyWith(
                              fontSize: 17.51, color: PetCareColor.darkgreen),
                        ),
                        SizedBox(height: height / 200),
                        Row(
                          children: [
                            Text(
                              "5.0 ",
                              style: fredokamedium.copyWith(
                                  fontSize: 12, color: PetCareColor.black),
                            ),
                            Image.asset(
                              PetCarePngimage.rating5,
                              width: width / 6,
                            ),
                            Text(
                              " (100 reviews)",
                              style: fredokamedium.copyWith(
                                  fontSize: 12, color: PetCareColor.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: height / 200),
                        Row(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  PetCarePngimage.time,
                                  height: height / 46,
                                ),
                                SizedBox(
                                  width: width / 56,
                                ),
                                Text(
                                  "Monday - Friday at 8.00 am - 5.00pm",
                                  style: fredokaregular.copyWith(
                                      fontSize: 10, color: PetCareColor.grey),
                                ),
                              ],
                            ),
                            SizedBox(width: width / 8.7),
                            Image.asset(
                              PetCarePngimage.placelocation,
                              height: height / 76,
                            ),
                            SizedBox(
                              width: width / 96,
                            ),
                            Text(
                              "2.5 km",
                              style: fredokaregular.copyWith(
                                  fontSize: 11, color: PetCareColor.grey),
                            ),
                          ],
                        ),
                        SizedBox(height: height / 200),
                        Text(
                          "1000 LKR for an Appointment",
                          style: fredokamedium.copyWith(
                              fontSize: 14, color: PetCareColor.primary),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height/36),
                Text(
                  "Dr. Shehan, one of the most skilled and experienced veterinarians and the owner of the most convenient animal clinic “Petz & Vetz” Our paradise is situated in the heart of the town with a pleasant environment. We are ready to treat your beloved doggos & puppers with love and involvement.",
                  style: fredokaregular.copyWith(fontSize: 12),
                  textAlign: TextAlign.start,
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Book the appointment now !",
                  style: fredokaregular.copyWith(fontSize: 12),
                ),
                SizedBox(height: height/96),
                Row(
                  children: [
                    Text(
                      "Recommended For: ",
                      style: fredokamedium.copyWith(fontSize: 12),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(50),
                          border: Border.all(
                              color: PetCareColor.purple)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width / 36),
                        child: Text(
                          "Bello",
                          style: fredokaregular.copyWith(
                              fontSize: 7,
                              color: PetCareColor.grey),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height/16),
                InkWell(
                  splashColor: PetCareColor.transparent,
                  highlightColor: PetCareColor.transparent,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const PetCareBookAppoinment();
                      },
                    ));
                  },
                  child: Container(
                    height: height / 15,
                    width: width / 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PetCareColor.primary),
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: width / 36),
                      child: Row(
                        children: [
                          SizedBox(
                            width: width / 1.27,
                            child: Center(
                              child: Text(
                                "Book an Appointment".tr,
                                style: fredokamedium.copyWith(
                                    fontSize: 15,
                                    color: PetCareColor.white),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Image.asset(
                            PetCarePngimage.deadline,
                            height: height / 36,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

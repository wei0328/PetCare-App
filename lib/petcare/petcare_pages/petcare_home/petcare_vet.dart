import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_home/petcare_veterinarydoctor.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareVet extends StatefulWidget {
  const PetCareVet({super.key});

  @override
  State<PetCareVet> createState() => _PetCareVetState();
}

class _PetCareVetState extends State<PetCareVet> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());

  List img = [
    PetCarePngimage.vet,
    PetCarePngimage.dog,
    PetCarePngimage.animals
  ];
  List title = ["Veterinary", "Grooming", "Boarding"];

  List img1 = [
    PetCarePngimage.doctor,
    PetCarePngimage.doctor1,
  ];

  List title1 = ["Dr. Nambuvan", "Dr. Sambuvan"];
  List subtitle1 = ["Bachelor of veterinary science ", "Veterinary Dentist "];

  List img2 = [
    PetCarePngimage.doctor2,
    PetCarePngimage.doctor3,
    PetCarePngimage.doctor4,
  ];

  List img3 = [
    PetCarePngimage.room,
    PetCarePngimage.room1,
  ];
  List title3 = ["Comb and Collar", "Cosmo Dog Cares"];
  List subtitle3 = ["OPEN", "CLOSED"];
  List color3 = [PetCareColor.primary, PetCareColor.red];

  List img4 = [
    PetCarePngimage.room2,
    PetCarePngimage.room3,
  ];
  List title4 = ["Dirty Paws Dog Spa", "Golden Bone"];
  List subtitle4 = ["OPEN", "CLOSED"];
  List color4 = [PetCareColor.primary, PetCareColor.red];

  List img5 = [
    PetCarePngimage.board,
    PetCarePngimage.board1,
  ];
  List title5 = ["Tails of the city", "Cutie Paws"];
  List subtitle5 = ["OPEN", "CLOSED"];
  List color5 = [PetCareColor.primary, PetCareColor.red];

  List img6 = [
    PetCarePngimage.board2,
    PetCarePngimage.board3,
  ];
  List title6 = ["Silver Paw Lodge", "Paw-some Dog"];
  List subtitle6 = ["OPEN", "CLOSED"];
  List color6 = [PetCareColor.primary, PetCareColor.red];

  int selected = 0;

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
          "Vet".tr,
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, How may I help you ?",
                style: fredokamedium.copyWith(fontSize: 20),
              ),
              SizedBox(
                height: height / 36,
              ),
              SizedBox(
                height: height / 9,
                child: ListView.builder(
                  itemCount: img.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: width / 5.2),
                      child: InkWell(
                        splashColor: PetCareColor.transparent,
                        highlightColor: PetCareColor.transparent,
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              height: height / 15,
                              width: height / 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: selected == index
                                      ? PetCareColor.select
                                      : PetCareColor.textfield),
                              child: Padding(
                                padding: const EdgeInsets.all(11),
                                child: Image.asset(
                                  img[index],
                                  height: height / 36,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 96,
                            ),
                            Text(
                              title[index],
                              style: fredokaregular.copyWith(
                                  fontSize: 15, color: PetCareColor.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: height / 96,
              ),
              const Divider(
                color: PetCareColor.grey,
              ),
              SizedBox(
                height: height / 96,
              ),
              if (selected == 0) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearby  Veterinarian",
                      style: fredokamedium.copyWith(fontSize: 20),
                    ),
                    Text(
                      "See all",
                      style: fredokaregular.copyWith(
                          fontSize: 15, color: PetCareColor.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 56,
                ),
                ListView.builder(
                  itemCount: img1.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: height / 56,right: width/16,left: width/16),
                      child: InkWell(
                        splashColor: PetCareColor.transparent,
                        highlightColor: PetCareColor.transparent,
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const PetCareVeterinaryDoctor();
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            img1[index],
                                            height: height / 15,
                                          ),
                                          SizedBox(
                                            width: width / 36,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                title1[index],
                                                style: fredokamedium.copyWith(
                                                    fontSize: 20,
                                                    color: PetCareColor.black),
                                              ),
                                              Text(
                                                subtitle1[index],
                                                style: fredokaregular.copyWith(
                                                    fontSize: 12,
                                                    color: PetCareColor.grey),
                                              ),
                                              Row(
                                                children: [
                                                  Image.asset(
                                                    PetCarePngimage.rating5,
                                                    width: width / 6,
                                                  ),
                                                  SizedBox(
                                                    width: width / 8.5,
                                                  ),
                                                  Text(
                                                    "5.0 {100 reviews}",
                                                    style: fredokamedium.copyWith(
                                                        fontSize: 12.5,
                                                        color:
                                                            PetCareColor.black),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 56),
                                      Row(
                                        children: [
                                          Text(
                                            "10 years of experience",
                                            style: fredokaregular.copyWith(
                                                fontSize: 10,
                                                color: PetCareColor.grey),
                                          ),
                                          const Spacer(),
                                          Image.asset(
                                            PetCarePngimage.placelocation,
                                            height: height / 56,
                                          ),
                                          SizedBox(
                                            width: width / 96,
                                          ),
                                          Text(
                                            "2.5 km",
                                            style: fredokaregular.copyWith(
                                                fontSize: 11,
                                                color: PetCareColor.grey),
                                          ),
                                          SizedBox(
                                            width: width / 26,
                                          ),
                                          Image.asset(
                                            PetCarePngimage.coin,
                                            height: height / 56,
                                          ),
                                          SizedBox(
                                            width: width / 96,
                                          ),
                                          Text(
                                            "100\$",
                                            style: fredokaregular.copyWith(
                                                fontSize: 11,
                                                color: PetCareColor.grey),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: height / 96),
                                      Row(
                                        children: [
                                          Image.asset(
                                            PetCarePngimage.time,
                                            height: height / 36,
                                          ),
                                          SizedBox(
                                            width: width / 56,
                                          ),
                                          Text(
                                            "Monday - Friday at 8.00 am - 5.00pm",
                                            style: fredokaregular.copyWith(
                                                fontSize: 10,
                                                color: PetCareColor.grey),
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
                      ),
                    );
                  },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended  Veterinarian",
                      style: fredokamedium.copyWith(fontSize: 20),
                    ),
                    Text(
                      "See all",
                      style: fredokaregular.copyWith(
                          fontSize: 15, color: PetCareColor.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 56,
                ),
                ListView.builder(
                  itemCount: img2.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: height / 56,right: width/16,left: width/16),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5, color: PetCareColor.iconcolor)
                            ],
                            color: PetCareColor.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          img2  [index],
                                          height: height / 15,
                                        ),
                                        SizedBox(
                                          width: width / 36,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Dr. Nambuvan",
                                              style: fredokamedium.copyWith(
                                                  fontSize: 20,
                                                  color: PetCareColor.black),
                                            ),
                                            Text(
                                              "Bachelor of veterinary science ",
                                              style: fredokaregular.copyWith(
                                                  fontSize: 12,
                                                  color: PetCareColor.grey),
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  PetCarePngimage.rating5,
                                                  width: width / 6,
                                                ),
                                                SizedBox(
                                                  width: width / 8.5,
                                                ),
                                                Text(
                                                  "5.0 {100 reviews}",
                                                  style: fredokamedium.copyWith(
                                                      fontSize: 12.5,
                                                      color:
                                                      PetCareColor.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 56),
                                    Row(
                                      children: [
                                        Text(
                                          "10 years of experience",
                                          style: fredokaregular.copyWith(
                                              fontSize: 10,
                                              color: PetCareColor.grey),
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          PetCarePngimage.placelocation,
                                          height: height / 56,
                                        ),
                                        SizedBox(
                                          width: width / 96,
                                        ),
                                        Text(
                                          "2.5 km",
                                          style: fredokaregular.copyWith(
                                              fontSize: 11,
                                              color: PetCareColor.grey),
                                        ),
                                        SizedBox(
                                          width: width / 26,
                                        ),
                                        Image.asset(
                                          PetCarePngimage.coin,
                                          height: height / 56,
                                        ),
                                        SizedBox(
                                          width: width / 96,
                                        ),
                                        Text(
                                          "100\$",
                                          style: fredokaregular.copyWith(
                                              fontSize: 11,
                                              color: PetCareColor.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 96),
                                    Row(
                                      children: [
                                        Image.asset(
                                          PetCarePngimage.time,
                                          height: height / 36,
                                        ),
                                        SizedBox(
                                          width: width / 56,
                                        ),
                                        Text(
                                          "Monday - Friday at 8.00 am - 5.00pm",
                                          style: fredokaregular.copyWith(
                                              fontSize: 10,
                                              color: PetCareColor.grey),
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
                  },
                )
              ],
              if(selected == 1) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearby Grooming room ",
                      style: fredokamedium.copyWith(fontSize: 20),
                    ),
                    Text(
                      "See all",
                      style: fredokaregular.copyWith(
                          fontSize: 15, color: PetCareColor.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 56,
                ),
                ListView.builder(
                  itemCount: img3.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: height / 56,right: width/16,left: width/16),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5, color: PetCareColor.iconcolor)
                            ],
                            color: PetCareColor.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          img3[index],
                                          width: width / 6,
                                          height: height / 15,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        SizedBox(
                                          width: width / 36,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              title3[index],
                                              style: fredokamedium.copyWith(
                                                  fontSize: 20,
                                                  color: PetCareColor.black),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  PetCarePngimage.rating5,
                                                  width: width / 6,
                                                ),
                                                SizedBox(
                                                  width: width / 8.5,
                                                ),
                                                Text(
                                                  "5.0 {100 reviews}",
                                                  style: fredokamedium.copyWith(
                                                      fontSize: 12.5,
                                                      color:
                                                      PetCareColor.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 56),
                                    Row(
                                      children: [
                                        Text(
                                          subtitle3[index],
                                          style: fredokaregular.copyWith(
                                              fontSize: 10,
                                              color: color3[index]),
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          PetCarePngimage.placelocation,
                                          height: height / 56,
                                        ),
                                        SizedBox(
                                          width: width / 96,
                                        ),
                                        Text(
                                          "2.5 km",
                                          style: fredokaregular.copyWith(
                                              fontSize: 11,
                                              color: PetCareColor.grey),
                                        ),
                                        SizedBox(
                                          width: width / 26,
                                        ),
                                        Image.asset(
                                          PetCarePngimage.coin,
                                          height: height / 56,
                                        ),
                                        SizedBox(
                                          width: width / 96,
                                        ),
                                        Text(
                                          "100\$",
                                          style: fredokaregular.copyWith(
                                              fontSize: 11,
                                              color: PetCareColor.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 96),
                                    Row(
                                      children: [
                                        Image.asset(
                                          PetCarePngimage.time,
                                          height: height / 36,
                                        ),
                                        SizedBox(
                                          width: width / 56,
                                        ),
                                        Text(
                                          "Monday - Friday at 8.00 am - 5.00pm",
                                          style: fredokaregular.copyWith(
                                              fontSize: 10,
                                              color: PetCareColor.grey),
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
                  },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended Grooming room",
                      style: fredokamedium.copyWith(fontSize: 20),
                    ),
                    Text(
                      "See all",
                      style: fredokaregular.copyWith(
                          fontSize: 15, color: PetCareColor.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 56,
                ),
                ListView.builder(
                  itemCount: img4.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: height / 56,right: width/16,left: width/16),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5, color: PetCareColor.iconcolor)
                            ],
                            color: PetCareColor.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          img4[index],
                                          height: height / 15,
                                        ),
                                        SizedBox(
                                          width: width / 36,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              title4[index],
                                              style: fredokamedium.copyWith(
                                                  fontSize: 20,
                                                  color: PetCareColor.black),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  PetCarePngimage.rating5,
                                                  width: width / 6,
                                                ),
                                                SizedBox(
                                                  width: width / 8.5,
                                                ),
                                                Text(
                                                  "5.0 {100 reviews}",
                                                  style: fredokamedium.copyWith(
                                                      fontSize: 12.5,
                                                      color:
                                                      PetCareColor.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 56),
                                    Row(
                                      children: [
                                        Text(
                                          subtitle4[index],
                                          style: fredokaregular.copyWith(
                                              fontSize: 10,
                                              color: color4[index]),
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          PetCarePngimage.placelocation,
                                          height: height / 56,
                                        ),
                                        SizedBox(
                                          width: width / 96,
                                        ),
                                        Text(
                                          "2.5 km",
                                          style: fredokaregular.copyWith(
                                              fontSize: 11,
                                              color: PetCareColor.grey),
                                        ),
                                        SizedBox(
                                          width: width / 26,
                                        ),
                                        Image.asset(
                                          PetCarePngimage.coin,
                                          height: height / 56,
                                        ),
                                        SizedBox(
                                          width: width / 96,
                                        ),
                                        Text(
                                          "100\$",
                                          style: fredokaregular.copyWith(
                                              fontSize: 11,
                                              color: PetCareColor.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 96),
                                    Row(
                                      children: [
                                        Image.asset(
                                          PetCarePngimage.time,
                                          height: height / 36,
                                        ),
                                        SizedBox(
                                          width: width / 56,
                                        ),
                                        Text(
                                          "Monday - Friday at 8.00 am - 5.00pm",
                                          style: fredokaregular.copyWith(
                                              fontSize: 10,
                                              color: PetCareColor.grey),
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
                  },
                )
              ],
              if(selected == 2) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nearby Boarding",
                      style: fredokamedium.copyWith(fontSize: 20),
                    ),
                    Text(
                      "See all",
                      style: fredokaregular.copyWith(
                          fontSize: 15, color: PetCareColor.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 56,
                ),
                ListView.builder(
                  itemCount: img5.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: height / 56,right: width/16,left: width/16),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5, color: PetCareColor.iconcolor)
                            ],
                            color: PetCareColor.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          img5[index],
                                          width: width / 6,
                                          height: height / 15,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        SizedBox(
                                          width: width / 36,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              title5[index],
                                              style: fredokamedium.copyWith(
                                                  fontSize: 20,
                                                  color: PetCareColor.black),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  PetCarePngimage.rating5,
                                                  width: width / 6,
                                                ),
                                                SizedBox(
                                                  width: width / 8.5,
                                                ),
                                                Text(
                                                  "5.0 {100 reviews}",
                                                  style: fredokamedium.copyWith(
                                                      fontSize: 12.5,
                                                      color:
                                                      PetCareColor.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 56),
                                    Row(
                                      children: [
                                        Text(
                                          subtitle5[index],
                                          style: fredokaregular.copyWith(
                                              fontSize: 10,
                                              color: color5[index]),
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          PetCarePngimage.placelocation,
                                          height: height / 56,
                                        ),
                                        SizedBox(
                                          width: width / 96,
                                        ),
                                        Text(
                                          "2.5 km",
                                          style: fredokaregular.copyWith(
                                              fontSize: 11,
                                              color: PetCareColor.grey),
                                        ),
                                        SizedBox(
                                          width: width / 26,
                                        ),
                                        Image.asset(
                                          PetCarePngimage.coin,
                                          height: height / 56,
                                        ),
                                        SizedBox(
                                          width: width / 96,
                                        ),
                                        Text(
                                          "100\$",
                                          style: fredokaregular.copyWith(
                                              fontSize: 11,
                                              color: PetCareColor.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 96),
                                    Row(
                                      children: [
                                        Image.asset(
                                          PetCarePngimage.time,
                                          height: height / 36,
                                        ),
                                        SizedBox(
                                          width: width / 56,
                                        ),
                                        Text(
                                          "Monday - Friday at 8.00 am - 5.00pm",
                                          style: fredokaregular.copyWith(
                                              fontSize: 10,
                                              color: PetCareColor.grey),
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
                  },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended Grooming room",
                      style: fredokamedium.copyWith(fontSize: 20),
                    ),
                    Text(
                      "See all",
                      style: fredokaregular.copyWith(
                          fontSize: 15, color: PetCareColor.grey),
                    ),
                  ],
                ),
                SizedBox(
                  height: height / 56,
                ),
                ListView.builder(
                  itemCount: img6.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: height / 56,right: width/16,left: width/16),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 5, color: PetCareColor.iconcolor)
                            ],
                            color: PetCareColor.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          img6[index],
                                          height: height / 15,
                                          width: width / 6,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        SizedBox(
                                          width: width / 36,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              title6[index],
                                              style: fredokamedium.copyWith(
                                                  fontSize: 20,
                                                  color: PetCareColor.black),
                                            ),
                                            SizedBox(
                                              height: height / 96,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  PetCarePngimage.rating5,
                                                  width: width / 6,
                                                ),
                                                SizedBox(
                                                  width: width / 8.5,
                                                ),
                                                Text(
                                                  "5.0 {100 reviews}",
                                                  style: fredokamedium.copyWith(
                                                      fontSize: 12.5,
                                                      color:
                                                      PetCareColor.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 56),
                                    Row(
                                      children: [
                                        Text(
                                          subtitle6[index],
                                          style: fredokaregular.copyWith(
                                              fontSize: 10,
                                              color: color6[index]),
                                        ),
                                        const Spacer(),
                                        Image.asset(
                                          PetCarePngimage.placelocation,
                                          height: height / 56,
                                        ),
                                        SizedBox(
                                          width: width / 96,
                                        ),
                                        Text(
                                          "2.5 km",
                                          style: fredokaregular.copyWith(
                                              fontSize: 11,
                                              color: PetCareColor.grey),
                                        ),
                                        SizedBox(
                                          width: width / 26,
                                        ),
                                        Image.asset(
                                          PetCarePngimage.coin,
                                          height: height / 56,
                                        ),
                                        SizedBox(
                                          width: width / 96,
                                        ),
                                        Text(
                                          "100\$",
                                          style: fredokaregular.copyWith(
                                              fontSize: 11,
                                              color: PetCareColor.grey),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height / 96),
                                    Row(
                                      children: [
                                        Image.asset(
                                          PetCarePngimage.time,
                                          height: height / 36,
                                        ),
                                        SizedBox(
                                          width: width / 56,
                                        ),
                                        Text(
                                          "Monday - Friday at 8.00 am - 5.00pm",
                                          style: fredokaregular.copyWith(
                                              fontSize: 10,
                                              color: PetCareColor.grey),
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
                  },
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareNotification extends StatefulWidget {
  const PetCareNotification({super.key});

  @override
  State<PetCareNotification> createState() => _PetCareNotificationState();
}

class _PetCareNotificationState extends State<PetCareNotification> {
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
          "Notifications".tr,
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
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: height / 15,
                        width: height / 15,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: PetCareColor.red),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(PetCarePngimage.device),
                        ),
                      ),
                      SizedBox(width: width / 36),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Food Spenser",
                            style: fredokaregular.copyWith(fontSize: 18),
                          ),
                          Text(
                            "Food quantity is low refil soon.",
                            style: fredokaregular.copyWith(
                                fontSize: 15, color: PetCareColor.grey),
                          ),
                          Text(
                            "2m ago",
                            style: fredokaregular.copyWith(
                                fontSize: 12, color: PetCareColor.grey),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.chevron_right,
                        size: height / 36,
                        color: PetCareColor.grey,
                      )
                    ],
                  ),
                  SizedBox(height: height / 96),
                  const Divider(color: PetCareColor.grey),
                  SizedBox(height: height / 96),
                ],
              );
            },)
          ],
        ),
      ),
    );
  }
}

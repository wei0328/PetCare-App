import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareLoading extends StatefulWidget {
  const PetCareLoading({super.key});

  @override
  State<PetCareLoading> createState() => _PetCareLoadingState();
}

class _PetCareLoadingState extends State<PetCareLoading> {
  @override
  void initState() {
    super.initState();
    // goup();
  }

  // goup() async {
  //   await Future.delayed(const Duration(seconds: 1));
  //   Get.off(() => PetCareDashboard("0"));
  // }

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
      backgroundColor: PetCareColor.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              PetCarePngimage.loading,
              height: height / 4,
            ),
          ),
          Text(
            "L O A D I N G",
            style: fredokasemibold.copyWith(fontSize: 28),
          ),
        ],
      ),
    );
  }
}

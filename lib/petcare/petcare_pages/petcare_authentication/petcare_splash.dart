import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/petcare_onboarding.dart';

class PetCareSplash extends StatefulWidget {
  const PetCareSplash({super.key});

  @override
  State<PetCareSplash> createState() => _PetCareSplashState();
}

class _PetCareSplashState extends State<PetCareSplash> {
  @override
  void initState() {
    super.initState();
    goup();
  }

  goup() async {
    var navigator = Navigator.of(context);
    await Future.delayed(const Duration(seconds: 5));
    navigator.push(MaterialPageRoute(
      builder: (context) {
        return const PetCareOnBording();
      },
    ));
  }

  dynamic size;
  double height = 0.00;
  double width = 0.00;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: PetCareColor.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              PetCarePngimage.applogo,
              height: height / 6,
            ),
          ),
        ],
      ),
    );
  }
}

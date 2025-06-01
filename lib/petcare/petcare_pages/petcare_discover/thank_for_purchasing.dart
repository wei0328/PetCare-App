import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_dashboard/petcare_dashboard.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_home/petcare_home.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/my_order.dart';

class ThankPage extends StatelessWidget {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PetCareColor.primary,
        title: Text(
          "Purchase Complete",
          style:
              fredokamedium.copyWith(fontSize: 18, color: PetCareColor.white),
        ),
        automaticallyImplyLeading: false, // 隐藏返回按钮
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Your order has been placed.\n Thank you for your order.",
                style:
                    fredokamedium.copyWith(fontSize: 24, color: Colors.black),
              ),
              SizedBox(height: height / 36),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return PetCareOrder();
                    },
                  ));
                },
                child: Text(
                  'View Order',
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: PetCareColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(width / 2, 30),
                ),
              ),
              SizedBox(height: height / 70),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return PetCareDashboard("0");
                    },
                  ));
                },
                child: Text(
                  'Back to Home',
                  style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 255, 255, 255)),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: PetCareColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(width / 2, 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

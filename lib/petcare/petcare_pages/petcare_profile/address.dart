import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/auth_controller.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/petcare_signup.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'package:pet_care/petcare/petcare_dashboard/petcare_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyAddress extends StatefulWidget {
  final String initialAddress;

  const MyAddress({Key? key, required this.initialAddress});

  @override
  _MyAddressState createState() => _MyAddressState();
}

class _MyAddressState extends State<MyAddress> {
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserAddress();
  }

  Future<void> fetchUserAddress() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var userDocSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: user.uid)
            .get();
        if (userDocSnapshot.docs.isNotEmpty) {
          var userData = userDocSnapshot.docs.first.data();
          setState(() {
            addressController.text = userData['address'] ?? '';
          });
        } else {
          print('User document does not exist');
        }
      } else {
        print('No user currently signed in');
      }
    } catch (e) {
      print('Error getting user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PetCareColor.primary,
        title: Text('My Address'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: addressController,
              style: TextStyle(fontSize: 26),
              decoration: InputDecoration(
                labelText: 'Address:',
                labelStyle: TextStyle(
                    fontSize: 30, color: Color.fromARGB(255, 60, 60, 60)),
                fillColor: Color.fromARGB(255, 171, 171, 171),
                contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              onChanged: (value) {},
            ),
            SizedBox(
              height: 20,
              width: 56,
            ),
            ElevatedButton(
              onPressed: () {
                saveAddress();

                Navigator.pop(context);
              },
              child: Text(
                'Save',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: PetCareColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  minimumSize: Size(double.infinity, 30)),
            ),
          ],
        ),
      ),
    );
  }

  void saveAddress() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var userDocSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: user.uid)
            .get();
        if (userDocSnapshot.docs.isNotEmpty) {
          var userData = userDocSnapshot.docs.first;
          await userData.reference.update({'address': addressController.text});

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Address saved')),
          );
        } else {
          print('User document does not exist');
        }
      } else {
        print('No user currently signed in');
      }
    } catch (e) {
      print('Error updating address: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save address')),
      );
    }
  }
}

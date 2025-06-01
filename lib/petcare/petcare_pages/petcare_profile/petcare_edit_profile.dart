// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/auth_controller.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';

class PetCareEdit extends StatefulWidget {
  final String initialAddress;
  final String initialFirstName;
  final String initialLastName;
  final String initialPhoneNumber;

  const PetCareEdit({
    Key? key,
    required this.initialAddress,
    required this.initialFirstName,
    required this.initialLastName,
    required this.initialPhoneNumber,
  }) : super(key: key);

  @override
  State<PetCareEdit> createState() => _PetCareEditState();
}

class _PetCareEditState extends State<PetCareEdit> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());
  final AuthController authController = Get.find<AuthController>();
  TextEditingController addressController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  @override
  void dispose() {
    addressController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> fetchUserInfo() async {
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
            firstNameController.text = userData['firstName'] ?? '';
            lastNameController.text = userData['lastName'] ?? '';
            phoneController.text = userData['phoneNumber'] ?? '';
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
          ),
        ),
        backgroundColor: PetCareColor.primary,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: fredokamedium.copyWith(
            fontSize: 17.51,
            color: PetCareColor.white,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width / 36,
          vertical: height / 36,
        ),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              cursorColor: PetCareColor.grey,
              style: fredokasemibold.copyWith(
                fontSize: 15,
                color: PetCareColor.black,
              ),
              decoration: InputDecoration(
                hintText: 'First Name',
                filled: true,
                fillColor: PetCareColor.textfield,
                hintStyle: fredokasemibold.copyWith(
                  fontSize: 15,
                  color: PetCareColor.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: height / 56),
            TextField(
              controller: lastNameController,
              scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              cursorColor: PetCareColor.grey,
              style: fredokasemibold.copyWith(
                fontSize: 15,
                color: PetCareColor.black,
              ),
              decoration: InputDecoration(
                hintText: 'Last Name',
                filled: true,
                fillColor: PetCareColor.textfield,
                hintStyle: fredokasemibold.copyWith(
                  fontSize: 15,
                  color: PetCareColor.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: height / 56),
            TextField(
              controller: phoneController,
              scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              cursorColor: PetCareColor.grey,
              style: fredokasemibold.copyWith(
                fontSize: 15,
                color: PetCareColor.black,
              ),
              decoration: InputDecoration(
                hintText: 'Phone Number',
                filled: true,
                fillColor: PetCareColor.textfield,
                hintStyle: fredokasemibold.copyWith(
                  fontSize: 15,
                  color: PetCareColor.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: height / 56),
            TextField(
              controller: addressController,
              scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              cursorColor: PetCareColor.grey,
              style: fredokasemibold.copyWith(
                fontSize: 15,
                color: PetCareColor.black,
              ),
              decoration: InputDecoration(
                hintText: 'Address',
                filled: true,
                fillColor: PetCareColor.textfield,
                hintStyle: fredokasemibold.copyWith(
                  fontSize: 15,
                  color: PetCareColor.grey,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: height / 56),
            ElevatedButton(
              onPressed: () {
                saveInfo();
                Navigator.pop(context, 'refresh');
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
                minimumSize: Size(double.infinity, 30),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void saveInfo() async {
    try {
      var user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        var userDocSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: user.uid)
            .get();
        if (userDocSnapshot.docs.isNotEmpty) {
          var userData = userDocSnapshot.docs.first;
          await userData.reference.update({
            'address': addressController.text,
            'firstName': firstNameController.text,
            'lastName': lastNameController.text,
            'phoneNumber': phoneController.text,
          });

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Saved')),
          );
        } else {
          print('User document does not exist');
        }
      } else {
        print('No user currently signed in');
      }
    } catch (e) {
      print('Error updating: $e');

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to save')),
      );
    }
  }
}

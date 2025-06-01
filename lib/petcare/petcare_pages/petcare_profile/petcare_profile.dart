// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart' as FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:pet_care/petcare/petcare_dashboard/petcare_dashboard.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/auth_controller.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/petcare_login.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/my_order.dart';
// import 'package:pet_care/petcare/petcare_pages/petcare_authentication/petcare_onboarding.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/petcare_adddevice.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/petcare_addpet.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/petcare_edit_profile.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_authentication/auth_controller.dart'
    as PetCareAuth;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'address.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/my_appointment.dart';

class PetCareProfile extends StatefulWidget {
  const PetCareProfile({super.key});

  @override
  State<PetCareProfile> createState() => _PetCareProfileState();
}

class _PetCareProfileState extends State<PetCareProfile> {
  final AuthController authController = Get.put(AuthController());
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());

  // CollectionReference userCollection =
  //     FirebaseFirestore.instance.collection('users');
  String firstName = '';
  String email = '';
  String phoneNumber = '';
  String lastName = '';
  String address = '';

  Future<void> fetchUserInfo() async {
    try {
      var user = FirebaseAuth.FirebaseAuth.instance.currentUser;
      if (user != null) {
        var userDocSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('id', isEqualTo: user.uid)
            .get();
        if (userDocSnapshot.docs.isNotEmpty) {
          var userData = userDocSnapshot.docs.first.data();
          setState(() {
            firstName = userData['firstName'] ?? '';
            lastName = userData['lastName'] ?? '';
            email = userData['email'] ?? '';
            phoneNumber = userData['phoneNumber'] ?? '';
            address = userData['address'] ?? '';
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

  // userInfo(user, context) async{
  //   var user = await FirebaseAuth.FirebaseAuth.instance.currentUser();
  //   FirebaseFirestore.instance.collection('users').doc()
  // }

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  bool isDark = true;

  Future<bool> onbackpressed() async {
    return await showDialog(
        builder: (context) => AlertDialog(
              title: Center(
                child: Text("PetCare".tr,
                    textAlign: TextAlign.end,
                    style: fredokasemibold.copyWith(fontSize: 18)),
              ),
              content: Text(
                "Are you sure to logout from this app?".tr,
                style: fredokaregular.copyWith(fontSize: 14),
              ),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    Get.to(() => const PetCareLogin());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PetCareColor.primary),
                  child: Text("Yes",
                      style:
                          fredokaregular.copyWith(color: PetCareColor.white)),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: PetCareColor.primary),
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "No",
                      style: fredokaregular.copyWith(color: PetCareColor.white),
                    )),
              ],
            ),
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: PetCareColor.primary,
        centerTitle: true,
        title: Text(
          // user name
          //authController.userData?.firstName ?? '',
          firstName,

          // "Pixel Posse".tr,
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              PetCarePngimage.pet1,
              height: height / 46,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset(
            //   PetCarePngimage.profile,
            //   height: height / 3,
            //   width: width / 1,
            //   fit: BoxFit.fitWidth,
            // ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 36, vertical: height / 10),
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
                                // user name
                                //authController.userData?.firstName ?? '',
                                "${firstName} ${lastName}",
                                style: fredokabold.copyWith(
                                    fontSize: 26, color: PetCareColor.black),
                              ),
                              const Spacer(),
                              InkWell(
                                splashColor: PetCareColor.transparent,
                                highlightColor: PetCareColor.transparent,
                                onTap: () {
                                  // Edit Profile
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PetCareEdit(
                                          initialAddress: 'initialAddress',
                                          initialFirstName: 'initialFirstName',
                                          initialLastName: 'initialLastName',
                                          initialPhoneNumber:
                                              'initialPhoneNumber'),
                                    ),
                                  ).then((refresh) {
                                    if (refresh == 'refresh') {
                                      fetchUserInfo();
                                      setState(() {});
                                    }
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      "Edit",
                                      style: fredokasemibold.copyWith(
                                          fontSize: 15,
                                          color: PetCareColor.primary),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 56,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width / 36,
                              ),
                              SvgPicture.asset(
                                PetCareSvgicons.email,
                                height: height / 50,
                              ),
                              SizedBox(
                                width: width / 36,
                              ),
                              Text(
                                // user email
                                //authController.userData?.email ?? '',
                                email,

                                style: fredokamedium.copyWith(
                                    fontSize: 18, color: PetCareColor.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 56,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width / 36,
                              ),
                              SvgPicture.asset(
                                PetCareSvgicons.call,
                                height: height / 40,
                              ),
                              SizedBox(
                                width: width / 36,
                              ),
                              Text(
                                // user phone
                                //authController.userData?.phoneNumber ?? '',
                                phoneNumber,
                                style: fredokamedium.copyWith(
                                    fontSize: 18, color: PetCareColor.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height / 56,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: width / 36,
                              ),
                              SvgPicture.asset(
                                PetCareSvgicons.address,
                                height: height / 40,
                              ),
                              SizedBox(
                                width: width / 36,
                              ),
                              Text(
                                // user phone
                                //authController.userData?.phoneNumber ?? '',
                                address,
                                style: fredokamedium.copyWith(
                                    fontSize: 18, color: PetCareColor.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
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
                          horizontal: width / 36, vertical: height / 26),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            splashColor: PetCareColor.transparent,
                            highlightColor: PetCareColor.transparent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PetCareOrder(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width / 36,
                                ),
                                SvgPicture.asset(
                                  PetCareSvgicons.myorder,
                                  height: height / 40,
                                ),
                                SizedBox(
                                  width: width / 36,
                                ),
                                Text(
                                  "My Orders",
                                  style: fredokasemibold.copyWith(
                                      fontSize: 20, color: PetCareColor.black),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.chevron_right,
                                  size: height / 36,
                                  color: PetCareColor.grey,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          // InkWell(
                          //   splashColor: PetCareColor.transparent,
                          //   highlightColor: PetCareColor.transparent,
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => MyAddress(
                          //             initialAddress: 'Initial Address Here'),
                          //       ),
                          //     );
                          //   },
                          //   child: Row(
                          //     children: [
                          //       SizedBox(
                          //         width: width / 36,
                          //       ),
                          //       SvgPicture.asset(
                          //         PetCareSvgicons.address,
                          //         height: height / 40,
                          //       ),
                          //       SizedBox(
                          //         width: width / 36,
                          //       ),
                          //       Text(
                          //         "My Address",
                          //         style: fredokasemibold.copyWith(
                          //             fontSize: 20, color: PetCareColor.black),
                          //       ),
                          //       const Spacer(),
                          //       Icon(
                          //         Icons.chevron_right,
                          //         size: height / 36,
                          //         color: PetCareColor.grey,
                          //       )
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: height / 30,
                          // ),
                          InkWell(
                            splashColor: PetCareColor.transparent,
                            highlightColor: PetCareColor.transparent,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return const PetCareAddPet();
                                },
                              ));
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width / 36,
                                ),
                                SvgPicture.asset(
                                  PetCareSvgicons.pet,
                                  height: height / 40,
                                ),
                                SizedBox(
                                  width: width / 36,
                                ),
                                Text(
                                  "My Pet",
                                  style: fredokasemibold.copyWith(
                                      fontSize: 20, color: PetCareColor.black),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.chevron_right,
                                  size: height / 36,
                                  color: PetCareColor.grey,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          InkWell(
                            splashColor: PetCareColor.transparent,
                            highlightColor: PetCareColor.transparent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyAppointment(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width / 36,
                                ),
                                Image.asset(
                                  PetCarePngimage.calender,
                                  height: height / 40,
                                ),
                                SizedBox(
                                  width: width / 36,
                                ),
                                Text(
                                  "My Appointment",
                                  style: fredokasemibold.copyWith(
                                      fontSize: 20, color: PetCareColor.black),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.chevron_right,
                                  size: height / 36,
                                  color: PetCareColor.grey,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: height / 30,
                          ),
                          InkWell(
                            splashColor: PetCareColor.transparent,
                            highlightColor: PetCareColor.transparent,
                            onTap: () {
                              onbackpressed();
                            },
                            child: Row(
                              children: [
                                SizedBox(
                                  width: width / 36,
                                ),
                                SvgPicture.asset(
                                  PetCareSvgicons.logout,
                                  height: height / 40,
                                ),
                                SizedBox(
                                  width: width / 36,
                                ),
                                Text(
                                  "Sign Out",
                                  style: fredokasemibold.copyWith(
                                      fontSize: 20, color: PetCareColor.red),
                                ),
                                const Spacer(),
                                Icon(Icons.chevron_right,
                                    size: height / 36,
                                    color: Colors.transparent)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  _showbottomsheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(7),
              ),
              height: height / 4,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10,
                      bottom: 10,
                    ),
                    child: Text('Select Application Layout'.tr,
                        style: fredokabold.copyWith(
                          fontSize: 14,
                        )),
                  ),
                  const Divider(),
                  SizedBox(
                    height: height / 26,
                    child: InkWell(
                      highlightColor: PetCareColor.transparent,
                      splashColor: PetCareColor.transparent,
                      onTap: () async {
                        await Get.updateLocale(const Locale('en', 'US'));
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'LTR'.tr,
                            style: fredokasemibold.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: height / 26,
                    child: InkWell(
                      highlightColor: PetCareColor.transparent,
                      splashColor: PetCareColor.transparent,
                      onTap: () async {
                        await Get.updateLocale(const Locale('ar', 'ab'));
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'RTL'.tr,
                            style: fredokasemibold.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  SizedBox(
                    height: height / 26,
                    child: InkWell(
                      highlightColor: PetCareColor.transparent,
                      splashColor: PetCareColor.transparent,
                      onTap: () async {
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Cancel'.tr,
                            style: fredokasemibold.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        });
  }
}

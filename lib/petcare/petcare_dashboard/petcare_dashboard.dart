import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_discover/petcare_discover.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_home/petcare_home.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_manage/petcare_manage.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/petcare_profile.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore: must_be_immutable
class PetCareDashboard extends StatefulWidget {
  String? index;

  PetCareDashboard(this.index, {super.key});

  @override
  State<PetCareDashboard> createState() => _PetCareDashboardState();
}

class _PetCareDashboardState extends State<PetCareDashboard> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());
  // final centralState = Get.put(CentralState());

  int _selectedItemIndex = 0;

  final List<Widget> _pages = const [
    PetCareHome(),
    PetCareDiscover(),
    // PetCareExplore(),
    BarAppointment(),
    PetCareProfile(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future<bool> onbackpressed() async {
    return await showDialog(
        builder: (context) => AlertDialog(
              title: Center(
                child: Text("Pet Care".tr,
                    textAlign: TextAlign.end,
                    style: fredokabold.copyWith(
                        fontSize: 18,
                        color: themedata.isdark
                            ? PetCareColor.white
                            : PetCareColor.black)),
              ),
              content: Text(
                "Are_you_sure_exit_this_app".tr,
                style: fredokaregular.copyWith(
                    fontSize: 14,
                    color: themedata.isdark
                        ? PetCareColor.white
                        : PetCareColor.black),
                textAlign: TextAlign.center,
              ),
              actionsAlignment: MainAxisAlignment.end,
              actions: [
                ElevatedButton(
                  onPressed: () async {
                    SystemNavigator.pop();
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

  Widget _bottomTabBar() {
    return Container(
      color: PetCareColor.primary,
      child: BottomNavigationBar(
        currentIndex: _selectedItemIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        backgroundColor: PetCareColor.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  PetCareSvgicons.home,
                  height: height / 36,
                ),
                Text(
                  "HOME",
                  style: fredokaregular.copyWith(
                      fontSize: 9, color: PetCareColor.white),
                )
              ],
            ),
            activeIcon: Container(
                width: width / 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: PetCareColor.selection),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 96),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        PetCareSvgicons.home,
                        height: height / 36,
                      ),
                      Text(
                        "HOME",
                        style: fredokaregular.copyWith(
                            fontSize: 9, color: PetCareColor.white),
                      )
                    ],
                  ),
                )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  PetCareSvgicons.discover,
                  height: height / 36,
                ),
                Text(
                  "DISCOVER",
                  style: fredokaregular.copyWith(
                      fontSize: 9, color: PetCareColor.white),
                )
              ],
            ),
            activeIcon: Container(
                width: width / 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: PetCareColor.selection),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 96),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        PetCareSvgicons.discover,
                        height: height / 36,
                      ),
                      Text(
                        "DISCOVER",
                        style: fredokaregular.copyWith(
                            fontSize: 9, color: PetCareColor.white),
                      )
                    ],
                  ),
                )),
            label: '',
          ),
          // BottomNavigationBarItem(
          //   icon: Column(
          //     children: [
          //       SvgPicture.asset(
          //         PetCareSvgicons.explore,
          //         height: height / 36,
          //       ),
          //       Text(
          //         "EXPLORE",
          //         style: fredokaregular.copyWith(
          //             fontSize: 9, color: PetCareColor.white),
          //       )
          //     ],
          //   ),
          //   activeIcon: Container(
          //       width: width / 6,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(15),
          //           color: PetCareColor.selection),
          //       child: Padding(
          //         padding: EdgeInsets.symmetric(vertical: height / 96),
          //         child: Column(
          //           children: [
          //             SvgPicture.asset(
          //               PetCareSvgicons.explore,
          //               height: height / 36,
          //             ),
          //             Text(
          //               "EXPLORE",
          //               style: fredokaregular.copyWith(
          //                   fontSize: 9, color: PetCareColor.white),
          //             )
          //           ],
          //         ),
          //       )),
          //   label: '',
          // ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  PetCareSvgicons.manage,
                  height: height / 36,
                ),
                Text(
                  "APPOINTMENT",
                  style: fredokaregular.copyWith(
                      fontSize: 9, color: PetCareColor.white),
                )
              ],
            ),
            activeIcon: Container(
                width: width / 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: PetCareColor.selection),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 96),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        PetCareSvgicons.manage,
                        height: height / 36,
                      ),
                      Text(
                        "APPOINTMENT",
                        style: fredokaregular.copyWith(
                            fontSize: 9, color: PetCareColor.white),
                      )
                    ],
                  ),
                )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(
                  PetCareSvgicons.profile,
                  height: height / 36,
                ),
                Text(
                  "PROFILE",
                  style: fredokaregular.copyWith(
                      fontSize: 9, color: PetCareColor.white),
                )
              ],
            ),
            activeIcon: Container(
                width: width / 6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: PetCareColor.selection),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: height / 96),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        PetCareSvgicons.profile,
                        height: height / 36,
                      ),
                      Text(
                        "PROFILE",
                        style: fredokaregular.copyWith(
                            fontSize: 9, color: PetCareColor.white),
                      )
                    ],
                  ),
                )),
            label: '',
          ),
        ],
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedItemIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return WillPopScope(
      onWillPop: onbackpressed,
      child: Scaffold(
        bottomNavigationBar: _bottomTabBar(),
        body: _pages[_selectedItemIndex],
      ),
    );
  }
}

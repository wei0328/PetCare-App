import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_discover/petcare_viewdetails.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_home/petcare_vet.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Pet {
  final String name;
  final String breed;
  final String id;

  Pet({required this.name, required this.breed, required this.id});
}

class TopProducts {
  final String name;
  final num price;
  final String id;
  final String image;
  final String collection;
  final String description;

  TopProducts(
      {required this.name,
      required this.price,
      required this.id,
      required this.image,
      required this.collection,
      required this.description});
}

class Appointment {
  final String date;
  final String pet;
  final String time;
  final String id;

  Appointment({
    required this.pet,
    required this.date,
    required this.time,
    required this.id,
  });
}

class PetCareHome extends StatefulWidget {
  const PetCareHome({super.key});

  @override
  State<PetCareHome> createState() => _PetCareHomeState();
}

class _PetCareHomeState extends State<PetCareHome> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());

  List<Appointment> appointments = [];
  List<Pet> pets = [];
  List<TopProducts> topProducts = [];

  Future<void> fetchAndAddUpcomingAppointment() async {
    var user = FirebaseAuth.instance.currentUser;
    String documentName = user?.uid ?? '';
    String collectionName = 'appointments';

    final DocumentReference documentRef =
        FirebaseFirestore.instance.collection(collectionName).doc(documentName);

    DocumentSnapshot documentSnapshot = await documentRef.get();

    Map<String, dynamic>? data =
        documentSnapshot.data() as Map<String, dynamic>?;
    if (data != null) {
      List<dynamic> filesData = data['files'] ?? [];
      filesData.sort((a, b) =>
          DateTime.parse(a['date']).compareTo(DateTime.parse(b['date'])));

      // 找到即將到來的第一個約會
      Appointment? firstUpcomingAppointment;
      for (dynamic fileData in filesData) {
        DateTime appointmentDate = DateTime.parse(fileData['date']);
        if (appointmentDate.isAfter(DateTime.now())) {
          firstUpcomingAppointment = Appointment(
            pet: fileData['pet'] ?? '',
            date: fileData['date'],
            time: fileData['time'] ?? '',
            id: fileData['id'] ?? '',
          );
          break;
        }
      }

      // 將即將到來的第一個約會添加到列表中
      if (firstUpcomingAppointment != null) {
        setState(() {
          appointments.add(firstUpcomingAppointment!);
        });
      } else {
        firstUpcomingAppointment = Appointment(
          pet: '',
          date: 'No upcoming appointments',
          time: '',
          id: '',
        );
      }
    }

    print(appointments);
  }

  Future<void> fetchPetsData() async {
    var user = FirebaseAuth.instance.currentUser;
    String documentName = user?.uid ?? '';
    String collectionName = 'pets';

    final DocumentReference documentRef =
        FirebaseFirestore.instance.collection(collectionName).doc(documentName);

    DocumentSnapshot documentSnapshot = await documentRef.get();

    if (documentSnapshot.exists) {
      setState(() {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        List<dynamic> filesData = data['files'] ?? [];

        pets = filesData.map((fileData) {
          String petsImage;
          if (fileData['breed'] == 'Cat') {
            petsImage = PetCarePngimage.catColor;
          } else if (fileData['breed'] == 'Dog') {
            petsImage = PetCarePngimage.dogColor;
          } else {
            petsImage = '';
          }
          return Pet(
            name: fileData['name'] ?? '',
            breed: petsImage,
            id: fileData['id'] ?? '',
          );
        }).toList();
      });
    }
  }

  Future<List<Map<String, dynamic>>> getTopSoldQuantities() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    QuerySnapshot querySnapshot =
        await _firestore.collection('soldQuantity').get();

    List<Map<String, dynamic>> sortedQuantities = [];
    querySnapshot.docs.forEach((doc) {
      String product = doc['product'] as String;
      int quantity = doc['quantity'] as int;
      String collection = doc['collection'] as String;
      sortedQuantities.add(
          {'product': product, 'quantity': quantity, 'collection': collection});
    });

    sortedQuantities.sort((a, b) => b['quantity'].compareTo(a['quantity']));

    List<Map<String, dynamic>> topSoldQuantities =
        sortedQuantities.take(5).toList();

    List<TopProducts> products = [];

    // 獲取這5個產品的數據
    for (int i = 0; i < topSoldQuantities.length; i++) {
      final QuerySnapshot productSnapshot = await _firestore
          .collection(topSoldQuantities[i]['collection'])
          .where('name', isEqualTo: topSoldQuantities[i]['product'])
          .get();

      for (DocumentSnapshot product in productSnapshot.docs) {
        Map<String, dynamic> productData =
            product.data() as Map<String, dynamic>;
        products.add(
          TopProducts(
              name: productData['name'] ?? '',
              price: productData['price'] ?? '',
              id: productData['id'] ?? '',
              image: productData['image'] ?? '',
              collection: sortedQuantities[i]['collection'] ?? '',
              description: productData['description'] ?? ''),
        );
      }
    }

    setState(() {
      topProducts = products;
    });

    print(topProducts);
    print(topSoldQuantities);
    return topSoldQuantities;
  }

  @override
  void initState() {
    super.initState();

    //pets = [Pet(name: "name", breed: "Cat", id: "id")];
    topProducts = [
      TopProducts(
          name: 'aaaaaaa',
          price: 99.9,
          id: "2333",
          image: 'https://i.ibb.co/X2XSY3w/Cat-Tree.jpg',
          collection: 'shopshop',
          description: 'abcdefg')
    ];

    // appointments = [
    //   Appointment(pet: 'pet', date: 'date', time: 'time', id: 'id')
    // ];

    fetchPetsData();
    getTopSoldQuantities();
    fetchAndAddUpcomingAppointment();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: width / 1,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 36),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pet Care".tr,
                style: fredokasemibold.copyWith(
                    fontSize: 16, color: PetCareColor.white),
              ),
            ],
          ),
        ),
        backgroundColor: PetCareColor.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                  color: PetCareColor.white,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width / 36, vertical: height / 56),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            PetCareSvgicons.pet,
                            height: height / 36,
                          ),
                          SizedBox(width: width / 36),
                          Text(
                            "My Pets",
                            style: fredokabold.copyWith(
                                fontSize: 19.7, color: PetCareColor.black),
                          ),
                        ],
                      ),
                      SizedBox(height: height / 56),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            if (pets.isEmpty)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 36),
                                child: Column(
                                  children: [
                                    Text(
                                      'You haven\'t added any pets',
                                      style: fredokaregular.copyWith(
                                        fontSize: 18,
                                        color: PetCareColor.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            for (var pet in pets)
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 36),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      pet.breed,
                                      height: height / 9,
                                    ),
                                    SizedBox(height: height / 96),
                                    Text(
                                      pet.name,
                                      style: fredokaregular.copyWith(
                                        fontSize: 17,
                                        color: PetCareColor.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height / 36),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(blurRadius: 5, color: PetCareColor.iconcolor)
                    ],
                    color: PetCareColor.white),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width / 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height / 56,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            PetCareSvgicons.food,
                            height: height / 36,
                            color: PetCareColor.black,
                          ),
                          SizedBox(width: width / 56),
                          Text(
                            "Best Seller",
                            style: fredokabold.copyWith(
                                fontSize: 19.7, color: PetCareColor.black),
                          ),
                        ],
                      ),
                      SizedBox(height: height / 56),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: topProducts.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            splashColor: PetCareColor.transparent,
                            highlightColor: PetCareColor.transparent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PetCareViewDetails(
                                      product: topProducts[index]),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.only(bottom: height / 56),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 5,
                                      color: PetCareColor.iconcolor,
                                    )
                                  ],
                                  color: PetCareColor.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: width / 36,
                                    vertical: height / 56,
                                  ),
                                  child: Row(
                                    children: [
                                      Image.network(
                                        topProducts[index].image,
                                        height: height / 14,
                                      ),
                                      SizedBox(width: width / 36),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: width / 1.6,
                                            child: Text(
                                              topProducts[index].name,
                                              style: fredokasemibold.copyWith(
                                                fontSize: 15,
                                                color: PetCareColor.black,
                                              ),
                                              softWrap: true,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: height / 100),
                                          Text(
                                            '\$ ${topProducts[index].price}',
                                            style: fredokaregular.copyWith(
                                              fontSize: 16,
                                              color: PetCareColor.grey,
                                            ),
                                          ),
                                          SizedBox(height: height / 300),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height / 36,
              ),
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
                      Row(
                        children: [
                          Image.asset(
                            PetCarePngimage.vet,
                            height: height / 36,
                          ),
                          SizedBox(width: width / 56),
                          Text(
                            "Upcoming Appointment",
                            style: fredokabold.copyWith(
                                fontSize: 19.7, color: PetCareColor.black),
                          ),
                        ],
                      ),
                      SizedBox(height: height / 56),
                      InkWell(
                        splashColor: PetCareColor.transparent,
                        highlightColor: PetCareColor.transparent,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 5,
                                    color: PetCareColor.iconcolor)
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
                                child: appointments.isNotEmpty
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: width / 36,
                                            vertical: height / 56),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  PetCarePngimage.pet3,
                                                  height: height / 10,
                                                ),
                                                SizedBox(
                                                  width: width / 36,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          appointments[0].date,
                                                          style: fredokamedium
                                                              .copyWith(
                                                                  fontSize: 20,
                                                                  color:
                                                                      PetCareColor
                                                                          .black),
                                                        ),
                                                        SizedBox(
                                                            width: width / 14),
                                                        Text(
                                                          'Time: ${appointments[0].time}',
                                                          style: fredokaregular
                                                              .copyWith(
                                                                  fontSize: 16,
                                                                  color: const Color
                                                                      .fromARGB(
                                                                      255,
                                                                      122,
                                                                      122,
                                                                      122)),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                        height: height / 200),
                                                    Text(
                                                      appointments[0].pet,
                                                      style: fredokaregular
                                                          .copyWith(
                                                              fontSize: 24,
                                                              color: PetCareColor
                                                                  .selection),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    : Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width / 36,
                                              vertical: height / 56),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                PetCarePngimage.pet3,
                                                height: height / 10,
                                              ),
                                              SizedBox(width: width / 36),
                                              Text(
                                                'You don\'t have any \nupcoming appointments',
                                                style: fredokaregular.copyWith(
                                                    fontSize: 18,
                                                    color: PetCareColor.black),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

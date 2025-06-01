import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_models/add_to_cart.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_discover/petcare_reviews.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_discover/thank_for_purchasing.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class PetCarePayment extends StatefulWidget {
  final double totalPrice;

  const PetCarePayment({Key? key, required this.totalPrice}) : super(key: key);

  @override
  State<PetCarePayment> createState() =>
      _PetCarePaymentState(totalPrice: totalPrice);
}

class _PetCarePaymentState extends State<PetCarePayment> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());
  final fullNameController = TextEditingController();
  final addressController = TextEditingController();
  late final double totalPrice;

  _PetCarePaymentState({required this.totalPrice});

  List img = [
    PetCarePngimage.visa,
    PetCarePngimage.mastercard,
    PetCarePngimage.american
  ];

  Future<void> newOrder() async {
    String generateShortId() {
      final uuid = Uuid();
      final shortId = uuid.v4().substring(0, 10);
      return shortId;
    }

    String fullName = fullNameController.text;
    String address = addressController.text;

    var user = FirebaseAuth.instance.currentUser;
    String documentName = user?.uid ?? '';
    String collectionName = 'orders';
    String orderId = generateShortId();

    final CollectionRef = FirebaseFirestore.instance.collection(collectionName);

    DateTime now = DateTime.now();
    String formattedDateTime =
        '${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')} ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}';

    List<Map<String, dynamic>> cartData = [];
    for (var product in cart) {
      Map<String, dynamic> productData = {
        'name': product.name,
        'price': product.price,
        'quantity': product.quantity,
      };
      cartData.add(productData);
    }
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(collectionName);

    await collectionRef.doc(documentName).set({
      'files': FieldValue.arrayUnion([
        {
          'id': orderId,
          'name': fullName,
          'address': address,
          'order': cartData,
          'total': totalPrice,
          'date': formattedDateTime
        }
      ])
    }, SetOptions(merge: true));

    cart = [];
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
            )),
        backgroundColor: PetCareColor.primary,
        centerTitle: true,
        title: Text(
          "Checkout".tr,
          style:
              fredokamedium.copyWith(fontSize: 18, color: PetCareColor.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: width / 1,
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
                      Text(
                        "Recipient information".tr,
                        style: fredokamedium.copyWith(
                            fontSize: 20, color: PetCareColor.black),
                      ),
                      SizedBox(
                        height: height / 120,
                      ),
                      Text(
                        "Full Name",
                        style: fredokamedium.copyWith(
                            fontSize: 16, color: PetCareColor.black),
                      ),
                      TextField(
                        controller: fullNameController,
                        scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        cursorColor: PetCareColor.grey,
                        style: fredokaregular.copyWith(
                          fontSize: 16,
                          color: PetCareColor.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Full Name'.tr,
                          hintStyle: fredokaregular.copyWith(
                              fontSize: 18, color: PetCareColor.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: PetCareColor.selection),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height / 200,
                      ),
                      Text(
                        "Address",
                        style: fredokamedium.copyWith(
                            fontSize: 18, color: PetCareColor.black),
                      ),
                      TextField(
                        controller: addressController,
                        scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        cursorColor: PetCareColor.grey,
                        style: fredokaregular.copyWith(
                          fontSize: 16,
                          color: PetCareColor.black,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Address'.tr,
                          hintStyle: fredokaregular.copyWith(
                              fontSize: 18, color: PetCareColor.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: PetCareColor.selection),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 10.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height / 36),
              Row(
                children: [
                  Text(
                    "Amount :".tr,
                    style: fredokamedium.copyWith(fontSize: 20),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "CAD ${widget.totalPrice}",
                        style: fredokamedium.copyWith(fontSize: 24),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 96),
              Text(
                "Select card type".tr,
                style: fredokamedium.copyWith(fontSize: 20),
              ),
              SizedBox(height: height / 96),
              SizedBox(
                height: height / 25,
                child: ListView.builder(
                  itemCount: img.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: width / 36),
                      child: Image.asset(
                        img[index],
                        width: width / 6,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: height / 56),
              Text(
                "Card number".tr,
                style: fredokamedium.copyWith(fontSize: 20),
              ),
              TextField(
                scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                cursorColor: PetCareColor.grey,
                style: fredokaregular.copyWith(
                  fontSize: 16,
                  color: PetCareColor.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Card number'.tr,
                  hintStyle: fredokaregular.copyWith(
                      fontSize: 18, color: PetCareColor.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: PetCareColor.selection),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
              SizedBox(height: height / 36),
              Text(
                "Name on the card".tr,
                style: fredokamedium.copyWith(fontSize: 20),
              ),
              TextField(
                scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                cursorColor: PetCareColor.grey,
                style: fredokaregular.copyWith(
                  fontSize: 16,
                  color: PetCareColor.black,
                ),
                decoration: InputDecoration(
                  hintText: 'Name on the card'.tr,
                  hintStyle: fredokaregular.copyWith(
                      fontSize: 18, color: PetCareColor.grey),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: PetCareColor.selection),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0,
                    horizontal: 10.0,
                  ),
                ),
              ),
              SizedBox(height: height / 36),
              Row(
                children: [
                  Text(
                    "CVC Number".tr,
                    style: fredokamedium.copyWith(fontSize: 20),
                  ),
                  SizedBox(width: width / 36),
                  Container(
                    width: width / 2.5,
                    child: TextField(
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      cursorColor: PetCareColor.grey,
                      style: fredokaregular.copyWith(
                          fontSize: 16, color: PetCareColor.black),
                      decoration: InputDecoration(
                        hintText: 'CVC Number'.tr,
                        hintStyle: fredokaregular.copyWith(
                            fontSize: 18, color: PetCareColor.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PetCareColor.selection,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 36),
              Row(
                children: [
                  Text(
                    "Expiring Date".tr,
                    style: fredokamedium.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    width: width / 6,
                    child: TextField(
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      cursorColor: PetCareColor.grey,
                      style: fredokaregular.copyWith(
                          fontSize: 16, color: PetCareColor.black),
                      decoration: InputDecoration(
                        hintText: 'MM'.tr,
                        hintStyle: fredokaregular.copyWith(
                            fontSize: 18, color: PetCareColor.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PetCareColor.selection,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "/".tr,
                    style: fredokamedium.copyWith(fontSize: 20),
                  ),
                  SizedBox(
                    width: width / 6,
                    child: TextField(
                      scrollPadding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      cursorColor: PetCareColor.grey,
                      style: fredokaregular.copyWith(
                          fontSize: 16, color: PetCareColor.black),
                      decoration: InputDecoration(
                        hintText: 'YY'.tr,
                        hintStyle: fredokaregular.copyWith(
                            fontSize: 18, color: PetCareColor.grey),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: PetCareColor.selection,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 26),
              ElevatedButton(
                onPressed: () {
                  updateSoldQuantity();
                  newOrder();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThankPage(),
                    ),
                  );
                },
                child: Text(
                  'Pay Now',
                  style: TextStyle(fontSize: 20, color: Colors.white),
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
      ),
    );
  }
}

import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_discover/petcare_payment.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'package:pet_care/petcare/petcare_models/add_to_cart.dart';
import 'package:flutter/material.dart';

class PetCareCart extends StatefulWidget {
  const PetCareCart({Key? key}) : super(key: key);

  @override
  State<PetCareCart> createState() => _PetCareCartState();
}

class _PetCareCartState extends State<PetCareCart> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());
  double totalPrice = 0;

  double calculateTotalPrice() {
    totalPrice = 0;
    for (int i = 0; i < cart.length; i++) {
      totalPrice += double.parse(cart[i].price) * cart[i].quantity;
    }
    totalPrice = double.parse(totalPrice.toStringAsFixed(2));
    return totalPrice;
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
          "Cart".tr,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: height / 1.5,
              child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final product = cart[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: height / 56),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        children: [
                          Container(
                            width: width / 4,
                            margin: EdgeInsets.only(left: width / 36),
                            child: SlidableAction(
                              autoClose: true,
                              onPressed: (value) {
                                //  fname.removeAt(index);
                                setState(() {});
                              },
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              backgroundColor: PetCareColor.red,
                              foregroundColor: Colors.white,
                              icon: Icons.delete_outline_sharp,
                            ),
                          ),
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5,
                              color: PetCareColor.iconcolor,
                            ),
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
                              Flexible(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10),
                                  child: Image.network(
                                    product.image,
                                    width: width / 4,
                                    height: height / 10,
                                  ),
                                ),
                              ),
                              Container(
                                width: width / 1.7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "\$ " + product.price,
                                      style: fredokamedium.copyWith(
                                        fontSize: 15,
                                        color: PetCareColor.primary,
                                      ),
                                    ),
                                    SizedBox(height: height / 200),
                                    Text(
                                      product.name,
                                      style: fredokasemibold.copyWith(
                                        fontSize: 16,
                                        color: PetCareColor.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      addOne(product.name);
                                      calculateTotalPrice();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.add,
                                      size: height / 36,
                                      color: PetCareColor.primary,
                                    ),
                                  ),
                                  SizedBox(height: height / 96),
                                  Text(
                                    product.quantity.toString(),
                                    style: fredokamedium.copyWith(
                                      fontSize: 15,
                                      color: PetCareColor.grey,
                                    ),
                                  ),
                                  SizedBox(height: height / 500),
                                  InkWell(
                                    onTap: () {
                                      minusOne(product.name);
                                      calculateTotalPrice();
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.minimize,
                                      size: height / 36,
                                      color: PetCareColor.primary,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: height / 96),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total".tr,
                  style: fredokabold.copyWith(fontSize: 18),
                ),
                Text(
                  "\$  ${calculateTotalPrice().toStringAsFixed(2)}".tr,
                  style: fredokabold.copyWith(fontSize: 18),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              splashColor: PetCareColor.transparent,
              highlightColor: PetCareColor.transparent,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PetCarePayment(
                        totalPrice: totalPrice,
                      );
                    },
                  ),
                );
              },
              child: Container(
                height: height / 16,
                width: width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: PetCareColor.primary,
                ),
                child: Center(
                  child: Text(
                    "Checkout".tr,
                    style: fredokamedium.copyWith(
                      fontSize: 18,
                      color: PetCareColor.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

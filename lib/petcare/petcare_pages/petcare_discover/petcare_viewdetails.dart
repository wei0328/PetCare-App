import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_models/add_to_cart.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_discover/petcare_cart.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_discover/petcare_discover.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'dart:convert';

class PetCareViewDetails extends StatefulWidget {
  const PetCareViewDetails({super.key, required this.product});
  final dynamic product;

  @override
  State<PetCareViewDetails> createState() => _PetCareViewDetailsState();
}

class _PetCareViewDetailsState extends State<PetCareViewDetails> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());
  int quantity = 1;

  void decreaseQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  void increaseQuantity() {
    setState(() {
      quantity++;
    });
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
          "Shop".tr,
          style:
              fredokamedium.copyWith(fontSize: 18, color: PetCareColor.white),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PetCareCart(),
                  ));
            },
            child: SvgPicture.asset(
              PetCareSvgicons.cart,
              height: height / 30,
            ),
          ),
          SizedBox(
            width: width / 56,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height / 150),
          Image.network(
            //PetCarePngimage.petvet4,
            widget.product.image,
            height: height / 3.5,
            width: width / 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width / 36, vertical: height / 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                        Text(
                          //"name",
                          widget.product.name,
                          style: fredokabold.copyWith(
                              fontSize: 20, color: PetCareColor.black),
                        ),
                        SizedBox(height: height / 200),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "CAD ${widget.product.price}",
                              style: fredokamedium.copyWith(
                                  fontSize: 16, color: PetCareColor.primary),
                            ),
                          ],
                        ),
                        SizedBox(height: height / 400),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 90,
                ),
                Text(
                  "Description:",
                  style: fredokaregular.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: PetCareColor.selection),
                ),
                SizedBox(height: height / 100),
                Container(
                  height: height / 5,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.description,
                          style: fredokaregular.copyWith(fontSize: 15),
                          maxLines: 10,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height / 80),
                Row(
                  children: [
                    Text(
                      "Quantity",
                      style: fredokamedium.copyWith(
                          fontSize: 14, color: PetCareColor.grey),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        decreaseQuantity();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: height / 120),
                        child: Icon(
                          Icons.minimize,
                          size: height / 36,
                          color: PetCareColor.primary,
                        ),
                      ),
                    ),
                    SizedBox(width: width / 36),
                    Container(
                      height: height / 20,
                      width: width / 500,
                      color: PetCareColor.textfield,
                    ),
                    SizedBox(width: width / 36),
                    Text(
                      quantity.toString(),
                      style: fredokamedium.copyWith(fontSize: 18),
                    ),
                    SizedBox(width: width / 36),
                    Container(
                      height: height / 20,
                      width: width / 500,
                      color: PetCareColor.textfield,
                    ),
                    SizedBox(width: width / 36),
                    InkWell(
                      onTap: () {
                        increaseQuantity();
                      },
                      child: Icon(
                        Icons.add,
                        size: height / 36,
                        color: PetCareColor.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height / 100),
                InkWell(
                  splashColor: PetCareColor.transparent,
                  highlightColor: PetCareColor.transparent,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return const PetCareCart();
                      },
                    ));
                  },
                  child: Container(
                    height: height / 15,
                    width: width / 1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: PetCareColor.primary),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width / 36),
                      child: InkWell(
                        onTap: () {
                          addToCart(
                              widget.product.name,
                              widget.product.price,
                              widget.product.image,
                              quantity,
                              widget.product.id,
                              widget.product.collection);
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: width / 1.27,
                              child: Center(
                                child: Text(
                                  "Add to cart".tr,
                                  style: fredokamedium.copyWith(
                                      fontSize: 15, color: PetCareColor.white),
                                ),
                              ),
                            ),
                            const Spacer(),
                            SvgPicture.asset(
                              PetCareSvgicons.cart1,
                              height: height / 36,
                              color: PetCareColor.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

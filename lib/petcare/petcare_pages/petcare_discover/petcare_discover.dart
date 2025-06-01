import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_discover/petcare_viewdetails.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_discover/petcare_cart.dart';
import 'package:pet_care/petcare/petcare_models/add_to_cart.dart';

class Food {
  final String name;
  final String price;
  final String image;
  final String description;
  final String id;
  final String collection;

  Food(
      {required this.name,
      required this.price,
      required this.image,
      required this.description,
      required this.id,
      required this.collection});
}

class Vetitem {
  final String name;
  final String price;
  final String image;
  final String description;
  final String id;
  final String collection;

  Vetitem(
      {required this.name,
      required this.price,
      required this.image,
      required this.description,
      required this.id,
      required this.collection});
}

class Accessory {
  final String name;
  final String price;
  final String image;
  final String description;
  final String id;
  final String collection;

  Accessory(
      {required this.name,
      required this.price,
      required this.image,
      required this.description,
      required this.id,
      required this.collection});
}

class Device {
  final String name;
  final String price;
  final String image;
  final String description;
  final String id;
  final String collection;

  Device(
      {required this.name,
      required this.price,
      required this.image,
      required this.description,
      required this.id,
      required this.collection});
}

class PetCareDiscover extends StatefulWidget {
  const PetCareDiscover({super.key});

  @override
  State<PetCareDiscover> createState() => _PetCareDiscoverState();
}

class _PetCareDiscoverState extends State<PetCareDiscover> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());

  List<Food> foods = [];
  List<Vetitem> vetItems = [];
  List<Accessory> accessories = [];
  List<Device> devices = [];

  Future<void> fetchFoodsData() async {
    String collectionName = 'shopFood';
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(collectionName);

    QuerySnapshot querySnapshot = await collectionRef.get();

    setState(() {
      foods = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Food(
            name: data['name'] ?? '',
            price: data['price'].toString(),
            image: data['image'] ?? '',
            description: data['description'] ?? '',
            collection: collectionName,
            id: data['id'] ?? '');
      }).toList();
    });
  }

  Future<void> fetchVetItemData() async {
    String collectionName = 'shop_vet_item';
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(collectionName);

    QuerySnapshot querySnapshot = await collectionRef.get();

    setState(() {
      vetItems = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Vetitem(
            name: data['name'] ?? '',
            price: data['price'].toString(),
            image: data['image'] ?? '',
            description: data['description'] ?? '',
            collection: collectionName,
            id: data['id'] ?? '');
      }).toList();
    });
  }

  Future<void> fetchAccessoriesData() async {
    String collectionName = 'shopAccessory';
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(collectionName);

    QuerySnapshot querySnapshot = await collectionRef.get();

    setState(() {
      accessories = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Accessory(
            name: data['name'] ?? '',
            price: data['price'].toString(),
            image: data['image'] ?? '',
            description: data['description'] ?? '',
            collection: collectionName,
            id: data['id'] ?? '');
      }).toList();
    });
  }

  Future<void> fetchDevicesData() async {
    String collectionName = 'shopDevice';
    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(collectionName);

    QuerySnapshot querySnapshot = await collectionRef.get();

    setState(() {
      devices = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Device(
            name: data['name'] ?? '',
            price: data['price'].toString(),
            image: data['image'] ?? '',
            description: data['description'] ?? '',
            collection: collectionName,
            id: data['id'] ?? '');
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    foods = [
      Food(
          name: "Caught Salmon & Ancient Grains Recipe Adult Dog Food [11 lb]",
          price: '40.00',
          image: "https://i.ibb.co/QYx6fnJ/kiwi-kitchen.jpg",
          description: "aabbcc",
          id: '12345',
          collection: 'teset'),
      Food(
          name: "pro2",
          price: '40.00',
          image: "https://i.ibb.co/QYx6fnJ/kiwi-kitchen.jpg",
          description: "aabbcc",
          id: '09887',
          collection: 'teset'),
    ];

    vetItems = [
      Vetitem(
          name: "Caught Salmon & Ancient Grains Recipe Adult Dog Food [11 lb]",
          price: '40.00',
          image: "https://i.ibb.co/QYx6fnJ/kiwi-kitchen.jpg",
          description: "aabbcc",
          id: '12345',
          collection: 'teset'),
      Vetitem(
          name: "pro2",
          price: '40.00',
          image: "https://i.ibb.co/QYx6fnJ/kiwi-kitchen.jpg",
          description: "aabbcc",
          id: '12345',
          collection: 'teset'),
    ];

    accessories = [
      Accessory(
          name: "Caught Salmon & Ancient Grains Recipe Adult Dog Food [11 lb]",
          price: '40.00',
          image: "https://i.ibb.co/QYx6fnJ/kiwi-kitchen.jpg",
          description: "aabbcc",
          id: '12345',
          collection: 'teset'),
      Accessory(
          name: "pro2",
          price: '40.00',
          image: "https://i.ibb.co/QYx6fnJ/kiwi-kitchen.jpg",
          description: "aabbcc",
          id: '12345',
          collection: 'teset'),
    ];

    devices = [
      Device(
          name: "Caught Salmon & Ancient Grains Recipe Adult Dog Food [11 lb]",
          price: '40.00',
          image: "https://i.ibb.co/QYx6fnJ/kiwi-kitchen.jpg",
          description: "aabbcc",
          id: '12345',
          collection: 'teset'),
      Device(
          name: "pro2",
          price: '40.00',
          image: "https://i.ibb.co/QYx6fnJ/kiwi-kitchen.jpg",
          description: "aabbcc",
          id: '12345',
          collection: 'teset'),
    ];

    fetchFoodsData();
    fetchVetItemData();
    fetchAccessoriesData();
    fetchDevicesData();
  }

  List img = [
    PetCarePngimage.petfood,
    PetCarePngimage.items,
    PetCarePngimage.accessories,
    PetCarePngimage.device
  ];
  List title = ["Food", "Vet Items", "Accessories", "IOT Devices"];
  int selected = 0;

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
          "Shop".tr,
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                  scrollPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  cursorColor: PetCareColor.grey,
                  style: fredokaregular.copyWith(
                      fontSize: 20, color: PetCareColor.black),
                  decoration: InputDecoration(
                    hintText: 'Search keywords..'.tr,
                    filled: true,
                    fillColor: PetCareColor.textfield,
                    prefixIcon: Icon(Icons.search,
                        size: height / 30, color: PetCareColor.grey),
                    hintStyle: fredokaregular.copyWith(
                        fontSize: 20, color: PetCareColor.grey),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                  )),
              SizedBox(
                height: height / 36,
              ),
              SizedBox(
                height: height / 9,
                child: ListView.builder(
                  itemCount: img.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: width / 8.2),
                      child: InkWell(
                        splashColor: PetCareColor.transparent,
                        highlightColor: PetCareColor.transparent,
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: Column(
                          children: [
                            Container(
                              height: height / 15,
                              width: height / 15,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: selected == index
                                      ? PetCareColor.select
                                      : PetCareColor.textfield),
                              child: Padding(
                                padding: const EdgeInsets.all(11),
                                child: Image.asset(
                                  img[index],
                                  height: height / 36,
                                  color: PetCareColor.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height / 96,
                            ),
                            Text(
                              title[index],
                              style: fredokaregular.copyWith(
                                  fontSize: 10, color: PetCareColor.grey),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: height / 56,
              ),
              if (selected == 0) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended Food",
                      style: fredokamedium.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(height: height / 56),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: foods.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        MediaQuery.of(context).size.aspectRatio * 3 / 1.75,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final food = foods[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5, color: PetCareColor.iconcolor)
                        ],
                        color: PetCareColor.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: height / 100),
                          InkWell(
                            splashColor: PetCareColor.transparent,
                            highlightColor: PetCareColor.transparent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PetCareViewDetails(product: food),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  food.image,
                                  height: height / 10,
                                ),
                                SizedBox(height: height / 100),
                                Text(
                                  "CAD ${food.price}",
                                  style: fredokamedium.copyWith(
                                    fontSize: 14,
                                    color: PetCareColor.primary,
                                  ),
                                ),
                                SizedBox(height: height / 100),
                                Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    food.name,
                                    style: fredokasemibold.copyWith(
                                      fontSize: 14,
                                      color: PetCareColor.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(height: height / 300),
                                const Divider(color: PetCareColor.grey),
                                SizedBox(height: height / 300),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              addToCart(food.name, food.price, food.image, 1,
                                  food.id, food.collection);
                            },
                            splashColor: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: width / 36),
                                Text(
                                  "Add to cart",
                                  style: fredokamedium.copyWith(
                                    fontSize: 15,
                                    color: PetCareColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
              if (selected == 1) ...[
                Text(
                  "Recommended Items",
                  style: fredokamedium.copyWith(fontSize: 20),
                ),
                SizedBox(height: height / 56),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: vetItems.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        MediaQuery.of(context).size.aspectRatio * 3 / 1.75,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final vetItem = vetItems[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5, color: PetCareColor.iconcolor)
                        ],
                        color: PetCareColor.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: height / 100),
                          InkWell(
                            splashColor: PetCareColor.transparent,
                            highlightColor: PetCareColor.transparent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PetCareViewDetails(product: vetItem),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  vetItem.image,
                                  height: height / 10,
                                ),
                                SizedBox(height: height / 100),
                                Text(
                                  "CAD ${vetItem.price}",
                                  style: fredokamedium.copyWith(
                                    fontSize: 14,
                                    color: PetCareColor.primary,
                                  ),
                                ),
                                SizedBox(height: height / 100),
                                Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    vetItem.name,
                                    style: fredokasemibold.copyWith(
                                      fontSize: 14,
                                      color: PetCareColor.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(height: height / 300),
                                const Divider(color: PetCareColor.grey),
                                SizedBox(height: height / 300),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              addToCart(
                                  vetItem.name,
                                  vetItem.price,
                                  vetItem.image,
                                  1,
                                  vetItem.id,
                                  vetItem.collection);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: width / 36),
                                Text(
                                  "Add to cart",
                                  style: fredokamedium.copyWith(
                                    fontSize: 15,
                                    color: PetCareColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
              if (selected == 2) ...[
                Text(
                  "Recommended Accessories",
                  style: fredokamedium.copyWith(fontSize: 20),
                ),
                SizedBox(height: height / 56),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: accessories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        MediaQuery.of(context).size.aspectRatio * 3 / 1.75,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final accessory = accessories[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5, color: PetCareColor.iconcolor)
                        ],
                        color: PetCareColor.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: height / 100),
                          InkWell(
                            splashColor: PetCareColor.transparent,
                            highlightColor: PetCareColor.transparent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PetCareViewDetails(product: accessory),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  accessory.image,
                                  height: height / 10,
                                ),
                                SizedBox(height: height / 100),
                                Text(
                                  "CAD ${accessory.price}",
                                  style: fredokamedium.copyWith(
                                    fontSize: 14,
                                    color: PetCareColor.primary,
                                  ),
                                ),
                                SizedBox(height: height / 100),
                                Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    accessory.name,
                                    style: fredokasemibold.copyWith(
                                      fontSize: 14,
                                      color: PetCareColor.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(height: height / 300),
                                const Divider(color: PetCareColor.grey),
                                SizedBox(height: height / 300),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              addToCart(
                                  accessory.name,
                                  accessory.price,
                                  accessory.image,
                                  1,
                                  accessory.id,
                                  accessory.collection);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: width / 36),
                                Text(
                                  "Add to cart",
                                  style: fredokamedium.copyWith(
                                    fontSize: 15,
                                    color: PetCareColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
              if (selected == 3) ...[
                Text(
                  "Recommended Devices",
                  style: fredokamedium.copyWith(fontSize: 20),
                ),
                SizedBox(height: height / 56),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: devices.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio:
                        MediaQuery.of(context).size.aspectRatio * 3 / 1.75,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                  ),
                  itemBuilder: (context, index) {
                    final device = devices[index];
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(
                              blurRadius: 5, color: PetCareColor.iconcolor)
                        ],
                        color: PetCareColor.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: height / 100),
                          InkWell(
                            splashColor: PetCareColor.transparent,
                            highlightColor: PetCareColor.transparent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PetCareViewDetails(product: device),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.network(
                                  device.image,
                                  height: height / 10,
                                ),
                                SizedBox(height: height / 100),
                                Text(
                                  "CAD ${device.price}",
                                  style: fredokamedium.copyWith(
                                    fontSize: 14,
                                    color: PetCareColor.primary,
                                  ),
                                ),
                                SizedBox(height: height / 100),
                                Container(
                                  height: 40,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text(
                                    device.name,
                                    style: fredokasemibold.copyWith(
                                      fontSize: 14,
                                      color: PetCareColor.black,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                SizedBox(height: height / 300),
                                const Divider(color: PetCareColor.grey),
                                SizedBox(height: height / 300),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              addToCart(device.name, device.price, device.image,
                                  1, device.id, device.collection);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: width / 36),
                                Text(
                                  "Add to cart",
                                  style: fredokamedium.copyWith(
                                    fontSize: 15,
                                    color: PetCareColor.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pet_care/petcare/petcare_dashboard/petcare_dashboard.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_home/petcare_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyOrder {
  final String address;
  final String date;
  final List<dynamic> order;
  final double total;
  final String id;

  MyOrder(
      {required this.address,
      required this.date,
      required this.order,
      required this.total,
      required this.id});
}

class PetCareOrder extends StatefulWidget {
  const PetCareOrder({Key? key}) : super(key: key);

  @override
  State<PetCareOrder> createState() => _PetCareOrderState();
}

class _PetCareOrderState extends State<PetCareOrder> {
  List<MyOrder> orders = [];

  Future<void> fetchOrdersData() async {
    var user = FirebaseAuth.instance.currentUser;
    String documentName = user?.uid ?? '';
    String collectionName = 'orders';

    final DocumentReference documentRef =
        FirebaseFirestore.instance.collection(collectionName).doc(documentName);

    DocumentSnapshot documentSnapshot = await documentRef.get();

    setState(() {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      List<dynamic> filesData = data['files'] ?? [];
      orders = filesData.map((fileData) {
        return MyOrder(
            address: fileData['address'] ?? '',
            date: fileData['date'] ?? '',
            order: fileData['order'],
            total: fileData['total'],
            id: fileData['id'] ?? '');
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();

    fetchOrdersData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
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
          "My Order".tr,
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
              orders.isEmpty
                  ? Center(
                      child: Text(
                        "You don't have any purchase records",
                        style: fredokaregular.copyWith(
                            fontSize: 18, color: PetCareColor.black),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: orders.length,
                      itemBuilder: (context, index) {
                        return buildOrderListItem(orders[index]);
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOrderListItem(MyOrder order) {
    List<DataRow> rows = [];

    for (var item in order.order) {
      rows.add(DataRow(
        cells: [
          DataCell(Text(item['name'].toString())),
          DataCell(Text(item['price'].toString())),
          DataCell(Text(item['quantity'].toString())),
        ],
      ));
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: PetCareColor.iconcolor,
          ),
        ],
        color: PetCareColor.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Number: ${order.id}',
              style: fredokasemibold.copyWith(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              'Address: ${order.address}',
              style: fredokaregular.copyWith(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total: ${order.total}',
                  style: fredokaregular.copyWith(fontSize: 16),
                ),
                Text(
                  'Date: ${order.date}',
                  style: fredokaregular.copyWith(fontSize: 16),
                ),
              ],
            ),
            ExpansionTile(
              title: Text(
                'Show Detail: ',
                style: fredokaregular.copyWith(fontSize: 16),
              ),
              children: [
                DataTable(
                  columns: [
                    DataColumn(
                      label: Text(
                        'Name',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Price',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      numeric: true,
                    ),
                    DataColumn(
                      label: Text(
                        'Q',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      numeric: true,
                    ),
                  ],
                  rows: [
                    for (var item in order.order)
                      DataRow(
                        cells: [
                          DataCell(
                            Text(
                              item['name'],
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          DataCell(
                            Text(
                              item['price'].toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          DataCell(
                            Text(
                              item['quantity'].toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

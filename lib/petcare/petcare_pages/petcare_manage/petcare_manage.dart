import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_care/petcare/petcare_dashboard/petcare_dashboard.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_home/petcare_bookappoinment.dart';
//import 'package:pet_care/petcare/petcare_pages/petcare_profile/edit_appointment.dart';
import '../petcare_profile/edit_appointment.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/edit_appointment.dart';

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

class BarAppointment extends StatefulWidget {
  const BarAppointment({Key? key}) : super(key: key);

  @override
  State<BarAppointment> createState() => BarAppointmentState();
}

class BarAppointmentState extends State<BarAppointment> {
  List<Appointment> appointments = [];

  Future<void> fetchAppointmentData() async {
    var user = FirebaseAuth.instance.currentUser;
    String documentName = user?.uid ?? '';
    String collectionName = 'appointments';

    final DocumentReference documentRef =
        FirebaseFirestore.instance.collection(collectionName).doc(documentName);

    DocumentSnapshot documentSnapshot = await documentRef.get();

    setState(() {
      Map<String, dynamic>? data =
          documentSnapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        List<dynamic> filesData = data['files'] ?? [];
        appointments = filesData.map((fileData) {
          return Appointment(
            pet: fileData['pet'] ?? '',
            date: fileData['date'],
            time: fileData['time'] ?? '',
            id: fileData['id'] ?? '',
          );
        }).toList();
      }
    });
  }

  bool isFutureAppointment(String date) {
    DateTime now = DateTime.now();
    DateTime appointmentDate = DateFormat('yyyy-MM-dd').parse(date);
    return appointmentDate.isAfter(now);
  }

  @override
  void initState() {
    super.initState();

    fetchAppointmentData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PetCareColor.primary,
        centerTitle: true,
        leading: SizedBox.shrink(),
        title: Text(
          "My Appointment".tr,
          style:
              fredokamedium.copyWith(fontSize: 18, color: PetCareColor.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String refresh = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PetCareBookAppoinment()));
              if (refresh == 'refresh') {
                fetchAppointmentData();
                setState(() {});
              }
            },
            icon: Icon(Icons.add, color: Colors.white),
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
              appointments.isEmpty
                  ? Center(
                      child: Text(
                        "You don't have any appointment records",
                        style: fredokaregular.copyWith(
                            fontSize: 18, color: PetCareColor.black),
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Upcoming Appointments",
                          style: fredokasemibold.copyWith(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: appointments.length,
                          itemBuilder: (context, index) {
                            if (isFutureAppointment(appointments[index].date)) {
                              return buildOrderListItem(
                                  appointments[index], true);
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                        Text(
                          "Past Appointments",
                          style: fredokasemibold.copyWith(fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: appointments.length,
                          itemBuilder: (context, index) {
                            if (!isFutureAppointment(
                                appointments[index].date)) {
                              return buildOrderListItem(
                                  appointments[index], false);
                            } else {
                              return SizedBox.shrink();
                            }
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildOrderListItem(Appointment thisAppointment, bool isFuture) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pet: ${thisAppointment.pet}',
                  style: fredokasemibold.copyWith(fontSize: 16),
                ),
                if (isFuture)
                  TextButton(
                    onPressed: () async {
                      String refresh = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditAppointment(
                            appointment: thisAppointment,
                          ),
                        ),
                      );
                      if (refresh == 'refresh') {
                        fetchAppointmentData();
                        setState(() {});
                      }
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
              ],
            ),
            SizedBox(height: height / 96),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date: ${thisAppointment.date}',
                  style: fredokaregular.copyWith(fontSize: 16),
                ),
                Text(
                  'Time: ${thisAppointment.time}',
                  style: fredokaregular.copyWith(fontSize: 16),
                ),
                SizedBox(width: width / 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

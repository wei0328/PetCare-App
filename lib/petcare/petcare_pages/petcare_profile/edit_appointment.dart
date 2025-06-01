import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:pet_care/petcare/petcare_theme/petcare_themecontroller.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:uuid/uuid.dart';
import 'package:pet_care/petcare/petcare_pages/petcare_profile/my_appointment.dart';

class Pet {
  final String name;
  final String id;

  Pet({required this.name, required this.id});
}

class Appointment {
  final String id;
  final String time;
  final String date;
  final String petId;

  Appointment({
    required this.id,
    required this.time,
    required this.date,
    required this.petId,
  });
}

class MyAppointment {
  final String date;
  final String time;

  MyAppointment({required this.date, required this.time});
}

class EditAppointment extends StatefulWidget {
  final dynamic appointment;
  const EditAppointment({Key? key, required this.appointment})
      : super(key: key);
  @override
  State<EditAppointment> createState() => _EditAppointmentState();
}

class _EditAppointmentState extends State<EditAppointment> {
  dynamic size;
  double height = 0.00;
  double width = 0.00;
  final themedata = Get.put(PetCareThemecontroler());

  late DateTime? _selectedDay;
  late String? selectedTime;
  late String? selectedPet;

  List<String> times = [
    "9:00",
    "9:30",
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "12:00",
    "12:30",
    "1:00",
    "1:30",
    "2:00",
    "2:30",
    "3:00",
    "3:30",
    "4:00",
    "4:30"
  ];

  List<Pet> pets = [];
  List<MyAppointment> myAppointments = [];

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
          return Pet(
            name: fileData['name'] ?? '',
            id: fileData['id'] ?? '',
          );
        }).toList();
      });
    }
  }

  Future<void> fetchMyAppointmentsData() async {
    var user = FirebaseAuth.instance.currentUser;
    String documentName = user?.uid ?? '';
    String collectionName = 'appointments';

    final DocumentReference documentRef =
        FirebaseFirestore.instance.collection(collectionName).doc(documentName);

    DocumentSnapshot documentSnapshot = await documentRef.get();

    if (documentSnapshot.exists) {
      setState(() {
        Map<String, dynamic> data =
            documentSnapshot.data() as Map<String, dynamic>;
        List<dynamic> filesData = data['files'] ?? [];
        myAppointments = filesData.map((fileData) {
          return MyAppointment(
            date: fileData['date'] ?? '',
            time: fileData['time'] ?? '',
          );
        }).toList();
      });
    }
  }

  void handleBookAppointment() {
    String formattedDate = _selectedDay != null
        ? DateFormat('yyyy-MM-dd').format(_selectedDay!)
        : "";
    String whichPet;
    if (selectedPet == "No Pet Selected") {
      whichPet = "No Pet Selected";
    } else {
      whichPet = pets.firstWhere((pet) => pet.name == selectedPet).name;
    }

    if (_selectedDay == null || selectedTime == null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Please select Date and Time"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
      //return;
    }

    for (int i = 0; i < myAppointments.length; i++) {
      if (formattedDate == myAppointments[i].date &&
          selectedTime == myAppointments[i].time) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("You already have an appointment for this time."),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
        return;
      }
    }

    updateAppointment(whichPet);
  }

  Future<void> updateAppointment(String pet) async {
    var user = FirebaseAuth.instance.currentUser;
    String documentName = user?.uid ?? '';
    String collectionName = 'appointments';

    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(collectionName);

    String appointmentId = widget.appointment.id;
    String formattedDate = _selectedDay != null
        ? DateFormat('yyyy-MM-dd').format(_selectedDay!)
        : "";
    DocumentSnapshot documentSnapshot =
        await collectionRef.doc(documentName).get();
    Map<String, dynamic> appointmentData =
        documentSnapshot.data() as Map<String, dynamic>;

    if (appointmentData.containsKey('files')) {
      List<dynamic> files = appointmentData['files'];
      for (var file in files) {
        if (file['id'] == appointmentId) {
          file['time'] = selectedTime;
          file['date'] = formattedDate;
          file['pet'] = pet;
          break;
        }
      }
      await collectionRef
          .doc(documentName)
          .set({'files': files}, SetOptions(merge: true));
    }

    Navigator.pop(context, 'refresh');
  }

  Future<void> deleteAppointment() async {
    var user = FirebaseAuth.instance.currentUser;
    String documentName = user?.uid ?? '';
    String collectionName = 'appointments';

    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(collectionName);

    String appointmentId = widget.appointment.id;

    DocumentSnapshot documentSnapshot =
        await collectionRef.doc(documentName).get();
    Map<String, dynamic> appointmentData =
        documentSnapshot.data() as Map<String, dynamic>;

    if (appointmentData.containsKey('files')) {
      List<dynamic> files = appointmentData['files'];
      files.removeWhere((file) => file['id'] == appointmentId);
      await collectionRef
          .doc(documentName)
          .set({'files': files}, SetOptions(merge: true));
    }

    Navigator.pop(context, 'refresh');
  }

  @override
  void initState() {
    super.initState();
    fetchMyAppointmentsData();
    fetchPetsData();
    _selectedDay = DateTime.parse(widget.appointment.date);
    selectedTime = widget.appointment.time;
    selectedPet = widget.appointment.pet;
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
          "Appointment".tr,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Choose a Date",
                    style: fredokamedium.copyWith(fontSize: 24),
                  ),
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Cancel Appointment"),
                            content: Text(
                                "Are you sure you want to cancel the appointment?"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                  deleteAppointment(); // Call deleteAppointment method
                                },
                                child: Text("Confirm"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text("Cancel"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          //decoration: TextDecoration.underline,
                          color: Colors.red,
                          fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 56),
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
                  child: TableCalendar(
                    firstDay: DateTime.now(),
                    focusedDay: DateTime.now(),
                    lastDay: DateTime(2050),
                    headerVisible: true,
                    daysOfWeekVisible: true,
                    calendarStyle: CalendarStyle(
                      todayDecoration: BoxDecoration(
                          color: PetCareColor.primary,
                          borderRadius: BorderRadius.circular(50)),
                      todayTextStyle: const TextStyle(
                        color: PetCareColor.white,
                      ),
                      selectedDecoration: BoxDecoration(
                          color: PetCareColor.primary,
                          borderRadius: BorderRadius.circular(50)),
                      selectedTextStyle: const TextStyle(
                        color: PetCareColor.white,
                      ),
                      defaultDecoration: BoxDecoration(
                          color: PetCareColor.white,
                          borderRadius: BorderRadius.circular(50)),
                      defaultTextStyle: const TextStyle(
                        color: PetCareColor.black,
                      ),
                      weekendDecoration: BoxDecoration(
                          color: PetCareColor.white,
                          borderRadius: BorderRadius.circular(50)),
                      weekendTextStyle: const TextStyle(
                        color: PetCareColor.black,
                      ),
                      outsideDecoration: BoxDecoration(
                          color: PetCareColor.white,
                          borderRadius: BorderRadius.circular(50)),
                      outsideTextStyle: const TextStyle(
                        color: PetCareColor.black,
                      ),
                      disabledDecoration: BoxDecoration(
                          color: PetCareColor.white,
                          borderRadius: BorderRadius.circular(50)),
                      disabledTextStyle: const TextStyle(
                        color: PetCareColor.grey,
                      ),
                    ),
                    daysOfWeekStyle: const DaysOfWeekStyle(
                      weekdayStyle: TextStyle(
                        color: PetCareColor.black,
                      ),
                      weekendStyle: TextStyle(
                        color: PetCareColor.black,
                      ),
                    ),
                    shouldFillViewport: false,
                    currentDay: _selectedDay,
                    calendarFormat: CalendarFormat.month,
                    pageAnimationEnabled: false,
                    headerStyle: HeaderStyle(
                        leftChevronIcon: const Icon(Icons.chevron_left,
                            color: PetCareColor.primary),
                        rightChevronIcon: const Icon(Icons.chevron_right,
                            color: PetCareColor.primary),
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: fredokaregular.copyWith(
                            fontSize: 14, color: PetCareColor.black)),
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        _selectedDay = selectedDay;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: height / 36),
              Text(
                "Pick a Time",
                style: fredokamedium.copyWith(fontSize: 24),
              ),
              SizedBox(height: height / 56),
              Container(
                height: height / 15,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(blurRadius: 5, color: PetCareColor.iconcolor),
                  ],
                  color: PetCareColor.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 36),
                        child: Text(
                          selectedTime ?? "Pick a Time",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: PetCareColor.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: width - (width / 36 * 2),
                      height: height / 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                        color: PetCareColor.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: times.map((String time) {
                                      return SimpleDialogOption(
                                        onPressed: () {
                                          setState(() {
                                            selectedTime = time;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            time,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  selectedTime ?? 'Select Time',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: PetCareColor.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 36),
              Text(
                "Which Pet",
                style: fredokamedium.copyWith(fontSize: 24),
              ),
              SizedBox(height: height / 56),
              Container(
                height: height / 15,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(blurRadius: 5, color: PetCareColor.iconcolor),
                  ],
                  color: PetCareColor.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: width / 36),
                        child: Text(
                          selectedPet ?? "For Which Pet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: PetCareColor.black,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: width - (width / 36 * 2),
                      height: height / 15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                        color: PetCareColor.white,
                      ),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: pets.map((Pet pet) {
                                      return SimpleDialogOption(
                                        onPressed: () {
                                          setState(() {
                                            selectedPet = pet.name;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16.0),
                                          child: Text(
                                            pet.name,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Row(
                          children: [
                            Expanded(
                              child: Center(
                                child: Text(
                                  selectedPet ?? 'Select Pet',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_down,
                              color: PetCareColor.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height / 36),
              Container(
                height: height / 15,
                width: width / 1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: PetCareColor.primary,
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: handleBookAppointment,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Save".tr,
                          style: fredokamedium.copyWith(
                              fontSize: 18, color: PetCareColor.white),
                        ),
                        SizedBox(width: 8),
                        Image.asset(
                          PetCarePngimage.deadline,
                          height: height / 36,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

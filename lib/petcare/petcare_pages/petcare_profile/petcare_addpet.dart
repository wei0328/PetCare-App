import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_fontstyle.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_icons.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class Pet {
  final String name;
  final String breed;
  final String gender;
  final String age;
  final String height;
  final String weight;
  final String id;

  Pet(
      {required this.name,
      required this.breed,
      required this.gender,
      required this.age,
      required this.height,
      required this.weight,
      required this.id});
}

class PetCareAddPet extends StatefulWidget {
  const PetCareAddPet({Key? key}) : super(key: key);

  @override
  State<PetCareAddPet> createState() => _PetCareAddPetState();
}

class _PetCareAddPetState extends State<PetCareAddPet> {
  late TextEditingController petNameController;
  late TextEditingController ageController;
  late TextEditingController weightController;
  late TextEditingController heightController;

  String selectedGender = 'Boy';
  String selectedBreed = 'Dog';

  List<Pet> pets = [];

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
          String genderImage;
          if (fileData['breed'] == 'Cat') {
            petsImage = PetCarePngimage.catIcon;
          } else if (fileData['breed'] == 'Dog') {
            petsImage = PetCarePngimage.dogIcon;
          } else {
            petsImage = '';
          }
          if (fileData['gender'] == 'Girl') {
            genderImage = PetCarePngimage.girlIcon;
          } else if (fileData['gender'] == 'Boy') {
            genderImage = PetCarePngimage.boyIcon;
          } else {
            genderImage = '';
          }
          return Pet(
            name: fileData['name'] ?? '',
            breed: petsImage,
            gender: genderImage,
            age: fileData['age'].toString(),
            height: fileData['height'].toString(),
            weight: fileData['weight'].toString(),
            id: fileData['id'] ?? '',
          );
        }).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    petNameController = TextEditingController();
    ageController = TextEditingController();
    weightController = TextEditingController();
    heightController = TextEditingController();

    fetchPetsData();
  }

  Future<void> addPet() async {
    String petName = petNameController.text;
    String petBreed = selectedBreed;
    String petGender = selectedGender;
    String petAge = ageController.text;
    String petWeight = weightController.text;
    String petHeight = heightController.text;

    var user = FirebaseAuth.instance.currentUser;
    String documentName = user?.uid ?? '';
    String collectionName = 'pets';

    final CollectionReference collectionRef =
        FirebaseFirestore.instance.collection(collectionName);

    String petId = Uuid().v4();

    await collectionRef.doc(documentName).set({
      'files': FieldValue.arrayUnion([
        {
          'id': petId,
          'name': petName,
          'breed': petBreed,
          'gender': petGender,
          'age': petAge,
          'weight': petWeight,
          'height': petHeight,
        }
      ])
    }, SetOptions(merge: true));
    petNameController.clear();
    ageController.clear();
    weightController.clear();
    heightController.clear();
    fetchPetsData();
  }

  Future<void> deletePet(String id) async {
    var user = FirebaseAuth.instance.currentUser;
    String documentName = user?.uid ?? '';
    String collectionName = 'pets';

    DocumentReference docRef =
        FirebaseFirestore.instance.collection(collectionName).doc(documentName);

    // Fetch the current pet data
    DocumentSnapshot docSnapshot = await docRef.get();
    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      List<dynamic> petsData = data['files'] ?? [];

      // Filter out the pet with the specified ID
      List<dynamic> updatedPetsData =
          petsData.where((pet) => pet['id'] != id).toList();

      // Update the document with the modified pet data
      await docRef.update({
        'files': updatedPetsData,
      });
    }

    await fetchPetsData();
  }

  @override
  void dispose() {
    petNameController.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }

  InputDecoration _getCommonDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: PetCareColor.textfield,
      hintStyle:
          fredokasemibold.copyWith(fontSize: 15, color: PetCareColor.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
    );
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
          "My Pets",
          style: fredokamedium.copyWith(
              fontSize: 17.51, color: PetCareColor.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width / 36, vertical: height / 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 56),
              Text(
                "My Pets",
                style: fredokamedium.copyWith(fontSize: 20),
              ),
              SizedBox(height: height / 56),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pets.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: height / 56),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: PetCareColor.textfield,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: width / 36, vertical: height / 96),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Image.asset(
                                      pets[index].breed,
                                      width: width / 7,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${pets[index].name}',
                                        style: fredokasemibold.copyWith(
                                            fontSize: 24,
                                            color: PetCareColor.selection),
                                      ),
                                      Image.asset(
                                        pets[index].gender,
                                        width: width / 20,
                                      ),
                                      SizedBox(
                                        width: width / 4,
                                      ),
                                      Positioned(
                                        top: -30,
                                        right: -25,
                                        child: IconButton(
                                          icon: Icon(Icons.close,
                                              color: Colors.grey),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Delete Pet'),
                                                  content: Text(
                                                      'Are you sure you want to delete this pet?'),
                                                  actions: [
                                                    TextButton(
                                                      child: Text('Cancel'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child: Text('Delete'),
                                                      onPressed: () {
                                                        deletePet(
                                                            pets[index].id);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Age: ${pets[index].age}',
                                        style: fredokasemibold.copyWith(
                                            fontSize: 17),
                                      ),
                                      Text(
                                        'Height: ${pets[index].height}',
                                        style: fredokasemibold.copyWith(
                                            fontSize: 17),
                                      ),
                                      Text(
                                        'Weight: ${pets[index].weight}',
                                        style: fredokasemibold.copyWith(
                                            fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Text(
                "Add Pet",
                style: fredokamedium.copyWith(fontSize: 20),
              ),
              SizedBox(height: height / 36),
              TextField(
                controller: petNameController,
                scrollPadding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                cursorColor: PetCareColor.grey,
                style: fredokasemibold.copyWith(
                    fontSize: 15, color: PetCareColor.black),
                decoration: _getCommonDecoration('Pet Name'),
              ),
              SizedBox(height: height / 56),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 3.45,
                    child: DropdownButtonFormField(
                      value: selectedBreed,
                      decoration: _getCommonDecoration('Breed'),
                      items: ['Dog', 'Cat'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            selectedBreed = value;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: width / 3.45,
                    child: DropdownButtonFormField(
                      value: selectedGender,
                      decoration: _getCommonDecoration('Gender'),
                      items: ['Boy', 'Girl'].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            selectedGender = value;
                          });
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: width / 3.45,
                    child: TextField(
                      controller: ageController,
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      cursorColor: PetCareColor.grey,
                      style: fredokasemibold.copyWith(
                          fontSize: 15, color: PetCareColor.black),
                      decoration: _getCommonDecoration('Age'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 56),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width / 2.2,
                    child: TextField(
                      controller: heightController,
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      cursorColor: PetCareColor.grey,
                      style: fredokasemibold.copyWith(
                          fontSize: 15, color: PetCareColor.black),
                      decoration: _getCommonDecoration('Height'),
                    ),
                  ),
                  SizedBox(
                    width: width / 2.2,
                    child: TextField(
                      controller: weightController,
                      scrollPadding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      cursorColor: PetCareColor.grey,
                      style: fredokasemibold.copyWith(
                          fontSize: 15, color: PetCareColor.black),
                      decoration: _getCommonDecoration('Weight'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height / 26),
              ElevatedButton(
                onPressed: () {
                  addPet();
                },
                child: Text(
                  'Add Pet',
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
              SizedBox(height: height / 26),
            ],
          ),
        ),
      ),
    );
  }
}

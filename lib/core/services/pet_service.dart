import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/pet_model.dart';

class PetService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get _userId => _auth.currentUser?.uid ?? '';
  String get _collectionName => 'pets';

  Future<List<Pet>> fetchPets() async {
    final DocumentReference documentRef =
        _firestore.collection(_collectionName).doc(_userId);
    final DocumentSnapshot documentSnapshot = await documentRef.get();

    if (documentSnapshot.exists) {
      Map<String, dynamic> data =
          documentSnapshot.data() as Map<String, dynamic>;
      List<dynamic> filesData = data['files'] ?? [];
      return filesData.map((fileData) => Pet.fromMap(fileData)).toList();
    }
    return [];
  }

  Future<void> addPet(Pet pet) async {
    await _firestore.collection(_collectionName).doc(_userId).set({
      'files': FieldValue.arrayUnion([pet.toMap()])
    }, SetOptions(merge: true));
  }

  Future<void> deletePet(String petId) async {
    DocumentReference docRef =
        _firestore.collection(_collectionName).doc(_userId);
    DocumentSnapshot docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
      List<dynamic> petsData = data['files'] ?? [];
      List<dynamic> updatedPetsData =
          petsData.where((pet) => pet['id'] != petId).toList();

      await docRef.update({
        'files': updatedPetsData,
      });
    }
  }
}

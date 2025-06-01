import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/pet_model.dart';
import '../services/pet_service.dart';

class PetViewModel extends ChangeNotifier {
  final PetService _petService = PetService();
  List<Pet> _pets = [];
  bool _isLoading = false;

  List<Pet> get pets => _pets;
  bool get isLoading => _isLoading;

  // Controllers
  final TextEditingController petNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  String selectedGender = 'Boy';
  String selectedBreed = 'Dog';

  Future<void> fetchPets() async {
    _isLoading = true;
    notifyListeners();

    try {
      _pets = await _petService.fetchPets();
    } catch (e) {
      debugPrint('Error fetching pets: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> addPet() async {
    final pet = Pet(
      id: const Uuid().v4(),
      name: petNameController.text,
      breed: selectedBreed,
      gender: selectedGender,
      age: ageController.text,
      height: heightController.text,
      weight: weightController.text,
    );

    try {
      await _petService.addPet(pet);
      clearControllers();
      await fetchPets();
    } catch (e) {
      debugPrint('Error adding pet: $e');
    }
  }

  Future<void> deletePet(String id) async {
    try {
      await _petService.deletePet(id);
      await fetchPets();
    } catch (e) {
      debugPrint('Error deleting pet: $e');
    }
  }

  void clearControllers() {
    petNameController.clear();
    ageController.clear();
    weightController.clear();
    heightController.clear();
  }

  @override
  void dispose() {
    petNameController.dispose();
    ageController.dispose();
    weightController.dispose();
    heightController.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import '../../core/viewmodels/pet_viewmodel.dart';
import '../theme/app_colors.dart';

class PetForm extends StatelessWidget {
  final PetViewModel viewModel;

  const PetForm({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Column(
      children: [
        TextField(
          controller: viewModel.petNameController,
          scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          cursorColor: AppColors.grey,
          style: const TextStyle(
            fontSize: 15,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
          ),
          decoration: _getInputDecoration('Pet Name'),
        ),
        SizedBox(height: height / 56),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width / 3.45,
              child: DropdownButtonFormField(
                value: viewModel.selectedBreed,
                decoration: _getInputDecoration('Breed'),
                items: ['Dog', 'Cat'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    viewModel.selectedBreed = value;
                  }
                },
              ),
            ),
            SizedBox(
              width: width / 3.45,
              child: DropdownButtonFormField(
                value: viewModel.selectedGender,
                decoration: _getInputDecoration('Gender'),
                items: ['Boy', 'Girl'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    viewModel.selectedGender = value;
                  }
                },
              ),
            ),
            SizedBox(
              width: width / 3.45,
              child: TextField(
                controller: viewModel.ageController,
                scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                cursorColor: AppColors.grey,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
                decoration: _getInputDecoration('Age'),
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
                controller: viewModel.heightController,
                scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                cursorColor: AppColors.grey,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
                decoration: _getInputDecoration('Height'),
              ),
            ),
            SizedBox(
              width: width / 2.2,
              child: TextField(
                controller: viewModel.weightController,
                scrollPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                cursorColor: AppColors.grey,
                style: const TextStyle(
                  fontSize: 15,
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                ),
                decoration: _getInputDecoration('Weight'),
              ),
            ),
          ],
        ),
        SizedBox(height: height / 26),
        ElevatedButton(
          onPressed: viewModel.addPet,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            minimumSize: const Size(double.infinity, 30),
          ),
          child: const Text(
            'Add Pet',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        SizedBox(height: height / 26),
      ],
    );
  }

  InputDecoration _getInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: AppColors.textfield,
      hintStyle: const TextStyle(
        fontSize: 15,
        color: AppColors.grey,
        fontWeight: FontWeight.w600,
      ),
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
}

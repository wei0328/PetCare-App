import 'package:flutter/material.dart';
import '../../core/models/pet_model.dart';
import '../theme/app_colors.dart';

class PetListItem extends StatelessWidget {
  final Pet pet;
  final VoidCallback onDelete;

  const PetListItem({
    Key? key,
    required this.pet,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Padding(
      padding: EdgeInsets.only(bottom: height / 56),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.textfield,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width / 36,
            vertical: height / 96,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Image.asset(
                        _getPetImage(pet.breed),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          pet.name,
                          style: const TextStyle(
                            fontSize: 24,
                            color: AppColors.selection,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Image.asset(
                          _getGenderImage(pet.gender),
                          width: width / 20,
                        ),
                        SizedBox(width: width / 4),
                        IconButton(
                          icon: const Icon(Icons.close, color: AppColors.grey),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Delete Pet'),
                                  content: const Text(
                                    'Are you sure you want to delete this pet?',
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Delete'),
                                      onPressed: () {
                                        onDelete();
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Age: ${pet.age}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Height: ${pet.height}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Weight: ${pet.weight}',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
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
  }

  String _getPetImage(String breed) {
    return breed == 'Cat'
        ? 'assets/petcare_assets/petcare_pngimg/cat.png'
        : 'assets/petcare_assets/petcare_pngimg/dog.png';
  }

  String _getGenderImage(String gender) {
    return gender == 'Girl'
        ? 'assets/petcare_assets/petcare_pngimg/girl.png'
        : 'assets/petcare_assets/petcare_pngimg/boy.png';
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/viewmodels/pet_viewmodel.dart';
import '../theme/app_colors.dart';
import '../widgets/pet_list_item.dart';
import '../widgets/pet_form.dart';

class PetView extends StatelessWidget {
  const PetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PetViewModel()..fetchPets(),
      child: const PetViewContent(),
    );
  }
}

class PetViewContent extends StatelessWidget {
  const PetViewContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PetViewModel>(context);
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          splashColor: AppColors.transparent,
          highlightColor: AppColors.transparent,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: height / 30,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        centerTitle: true,
        title: const Text(
          "My Pets",
          style: TextStyle(
            fontSize: 17.51,
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width / 36,
            vertical: height / 36,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height / 56),
              const Text(
                "My Pets",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height / 56),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: viewModel.pets.length,
                itemBuilder: (context, index) => PetListItem(
                  pet: viewModel.pets[index],
                  onDelete: () => viewModel.deletePet(viewModel.pets[index].id),
                ),
              ),
              const Text(
                "Add Pet",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height / 36),
              PetForm(viewModel: viewModel),
            ],
          ),
        ),
      ),
    );
  }
}

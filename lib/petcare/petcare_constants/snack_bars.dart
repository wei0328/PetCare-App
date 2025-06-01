import 'package:flutter/material.dart';
import 'package:pet_care/petcare/petcare_globalclass/petcare_color.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void customErrorSnackBar(context, message) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.error(message: message, backgroundColor: PetCareColor.red),
    displayDuration: const Duration(seconds: 2),
  );
}

void customInfoSnackBar(context, message) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.info(message: message, backgroundColor: PetCareColor.info),
    displayDuration: const Duration(seconds: 2),
  );
}

void customSuccessSnackBar(context, message, {seconds = 3}) {
  return showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(message: message, backgroundColor: PetCareColor.primary),
    displayDuration: Duration(seconds: seconds),
  );
}

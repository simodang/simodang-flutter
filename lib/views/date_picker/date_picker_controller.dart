import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerController extends GetxController {
  Rx<DateTime> startDate = DateTime.now().obs;
  Rx<DateTime> endDate = DateTime.fromMillisecondsSinceEpoch(0).obs;

  String getStartDate() {
    return formatDate(startDate.value, [dd, ' ', MM, ' ', yyyy]);
  }

  void setStartDate(DateTime date) {
    startDate.value = date;
  }

  String getEndDate() {
    if (endDate.value == DateTime.fromMillisecondsSinceEpoch(0)) {
      return '-';
    }

    return formatDate(endDate.value, [dd, ' ', MM, ' ', yyyy]);
  }

  void setEndDate(DateTime date) {
    endDate.value = date;
  }

  void onSelectionChanged (DateRangePickerSelectionChangedArgs args) {
    if (args.value.startDate == null || args.value.endDate == null) {
      return;
    }

    setStartDate(args.value.startDate);
    setEndDate(args.value.endDate);
    update();
  }

  String? validateDates(DateTime startDate, DateTime endDate) {
    if (endDate == DateTime.fromMillisecondsSinceEpoch(0)) {
      return 'Tanggal awal tidak boleh lebih besar dari tanggal akhir';
    }

    if (startDate.isAtSameMomentAs(endDate)) {
      return 'Tanggal awal tidak boleh sama dengan tanggal akhir';
    }

    return null;
  }

  void submit() {
    final validationResult = validateDates(startDate.value, endDate.value);
    if (validationResult != null) {
      Get.snackbar(
        "Error",
        validationResult,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    Get.back(
      result: {
        'startDate': startDate.value,
        'endDate': endDate.value,
      },
    );
  }
}

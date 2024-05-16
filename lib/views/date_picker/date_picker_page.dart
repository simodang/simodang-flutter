import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/date_picker/date_picker_controller.dart';
import 'package:simodang_flutter/views/widgets/label/row_label_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerPage extends StatelessWidget {
  const DatePickerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DatePickerController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tanggal Rerata'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SfDateRangePicker(
                  onSelectionChanged: controller.onSelectionChanged,
                  selectionMode: DateRangePickerSelectionMode.range,
                  initialSelectedDate: controller.startDate.value,
                  backgroundColor: Colors.transparent,
                ),
                const SizedBox(height: 20),
                RowLabelWidget(
                  label: "Tanggal Awal",
                  value: controller.getStartDate(),
                ),
                const SizedBox(height: 10),
                RowLabelWidget(
                  label: "Tanggal Akhir",
                  value: controller.getEndDate(),
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: controller.submit,
            child: const Icon(Icons.check),
          )
        );
      },
    );
  }
}

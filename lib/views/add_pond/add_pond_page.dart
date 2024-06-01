import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/views/add_pond/add_pond_controller.dart';
import 'package:simodang_flutter/views/widgets/steps/pond_device_step.dart';
import 'package:simodang_flutter/views/widgets/steps/pond_image_step.dart';
import 'package:simodang_flutter/views/widgets/steps/pond_info_step.dart';
import 'package:simodang_flutter/views/widgets/steps/pond_status_step.dart';

class AddPondPage extends StatelessWidget {
  const AddPondPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPondController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tambah Kolam'),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Stepper(
                  currentStep: controller.currentStep.value,
                  onStepContinue: controller.nextStep,
                  onStepCancel: controller.previousStep,
                  onStepTapped: controller.tapStep,
                  steps: [
                    Step(
                      title: const Text('Informasi Kolam'),
                      content: PondInfoStep(
                        setName: controller.setName,
                        setAddress: controller.setAddress,
                        setCity: controller.setCity,
                      ),
                    ),
                    Step(
                      title: const Text('Status Kolam'),
                      content: PondStatusStep(
                        setStatus: controller.setIsFilled,
                        status: controller.isFilled.value,
                      ),
                    ),
                    const Step(
                      title: Text('Perangkat Kolam'),
                      content: PondDeviceStep(),
                    ),
                    const Step(
                      title: Text('Gambar Kolam'),
                      content: PondImageStep(),
                    ),
                  ],
                )
              ],
            ),
          )
        );
      },
    );
  }
}

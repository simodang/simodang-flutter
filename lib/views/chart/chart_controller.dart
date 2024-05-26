import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:simodang_flutter/config/chart_time_list_constants.dart';
import 'package:simodang_flutter/data/datasources/remote/metric/metric_remote_data_source.dart';
import 'package:simodang_flutter/data/models/metric.dart';

class ChartController extends GetxController {
  final String? pondId = Get.parameters['id'];
  final String? property = Get.parameters['property'];
  RxList<Metric> metrics = <Metric>[].obs;
  int hours = ChartTimeListConstants().timeList.first.value;

  final List<ChartTime> chartTimeList = ChartTimeListConstants().timeList;

  RxBool isAveraged = false.obs;
  DateTime? startDate;
  DateTime? endDate;

  RxInt currentIndex = 0.obs;

  void changeIndex(int index) async {
    currentIndex.value = index;
    hours = chartTimeList[index].value;
    isAveraged.value = false;
    startDate = null;
    endDate = null;
    await fetchMetrics();
    update();
  }

  String getCasedProperty() {
    switch (property) {
      case 'temperature':
        return 'Suhu';
      case 'ph':
        return 'pH';
      case 'tdo':
        return 'TDO';
      case 'tds':
        return 'TDS';
      case 'turbidity':
        return 'Turbiditas';
      default:
        return '';
    }
  }

  bool isMetricsNotEmpty() {
    return metrics.isNotEmpty;
  }

  Future<void> fetchMetrics() async {
    if (pondId == null) return;

    if (isAveraged.value) {
      List<Metric> metrics = await MetricRemoteDataSource().getAveragedMetrics(
        pondId!,
        formatDate(startDate!, [yyyy, '-', mm, '-', dd]),
        formatDate(endDate!, [yyyy, '-', mm, '-', dd]),
      );
      this.metrics.value = metrics;
      return;
    }

    List<Metric> metrics = await MetricRemoteDataSource().getMetrics(
      pondId!,
      DateTime.now().toUtc().toIso8601String(),
      hours,
    );
    this.metrics.value = metrics;
    return;
  }

  Future<void> pickDate() async {
    var value = await Get.toNamed('/date-picker');
    if (value != null) {
      startDate = value["startDate"];
      endDate = value["endDate"];
      isAveraged.value = true;
      await fetchMetrics();
      currentIndex.value = 99;
      update();
    }
  }

  void refreshChart() {
    fetchMetrics();
    update();
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchMetrics();
    update();
  }
}

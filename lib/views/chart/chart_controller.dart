import 'package:get/get.dart';
import 'package:simodang_flutter/config/chart_time_list_constants.dart';
import 'package:simodang_flutter/data/datasources/remote/metric/metric_remote_data_source.dart';
import 'package:simodang_flutter/data/models/metric.dart';
import 'package:simodang_flutter/utils/logger/logger_singleton.dart';

class ChartController extends GetxController {
  final String? pondId = Get.parameters['id'];
  final String? property = Get.parameters['property'];
  RxList<Metric> metrics = <Metric>[].obs;
  int hours = ChartTimeListConstants().timeList.first.value;

  final List<ChartTime> chartTimeList = ChartTimeListConstants().timeList;

  RxInt currentIndex = 0.obs;

  void changeIndex(int index) async {
    currentIndex.value = index;
    hours = chartTimeList[index].value;
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
    if (pondId == null) {
      return;
    }
    final isoDate = DateTime.now().toUtc().toIso8601String();

    final metrics = await MetricRemoreDataSource().getMetrics(pondId ?? '', isoDate, hours);
    LoggerSingleton().logger.i(metrics);
    this.metrics.value = metrics;
  }

  @override
  void onInit() async {
    super.onInit();
    await fetchMetrics();
    update();
  }
}

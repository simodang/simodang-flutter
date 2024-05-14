import 'package:simodang_flutter/data/models/metric.dart';
import 'package:simodang_flutter/utils/dio/dio_client.dart';

class MetricRemoreDataSource {
  Future<List<Metric>> getMetrics(
    String pondId,
    String timeString,
    int hours,
  ) async {
    try {
      final response = await DioClient().get(
        "/metrics/$pondId",
        queryParameters: {
          "timeString": timeString,
          "hours": hours,
        },
      );
      final metrics = (response.data as List)
          .map((e) => Metric.fromJson(e as Map<String, dynamic>))
          .toList();
      return metrics;
    } catch (_) {
      rethrow;
    }
  }
}

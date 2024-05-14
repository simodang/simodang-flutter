import 'package:date_format/date_format.dart';
import 'package:json_annotation/json_annotation.dart';

part 'metric.g.dart';

@JsonSerializable()
class Metric {
  final String id;
  @JsonKey(fromJson: double.parse)
  final double temperature;
  @JsonKey(fromJson: double.parse)
  final double ph;
  @JsonKey(fromJson: double.parse)
  final double tdo;
  @JsonKey(fromJson: double.parse)
  final double tds;
  @JsonKey(fromJson: double.parse)
  final double turbidity;
  final String createdAt;

  Metric({
    required this.id,
    required this.temperature,
    required this.ph,
    required this.tdo,
    required this.tds,
    required this.turbidity,
    required this.createdAt,
  });

  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);

  Map<String, dynamic> toJson() => _$MetricToJson(this);

  factory Metric.empty() {
    return Metric(
      id: '',
      temperature: 0.0,
      ph: 0.0,
      tdo: 0.0,
      tds: 0.0,
      turbidity: 0.0,
      createdAt: '1970-01-01T00:00:00Z',
    );
  }

  double getMetric(String metricType) {
    switch (metricType) {
      case 'temperature':
        return temperature;
      case 'ph':
        return ph;
      case 'tdo':
        return tdo;
      case 'tds':
        return tds;
      case 'turbidity':
        return turbidity;
      default:
        return 0.0;
    }
  }

  String getUnit(String property) {
    switch (property) {
      case 'temperature':
        return '°C';
      case 'ph':
        return 'pH';
      case 'turbidity':
        return 'NTU';
      case 'tdo':
        return 'mg/L';
      case 'tds':
        return 'ppm';
      default:
        return '';
    }
  }

  String getFormattedTime() {
    final DateTime dateTime = DateTime.parse(createdAt).toLocal();

    return formatDate(dateTime, [HH, ':', nn, ':', ss]);
  }

  String getFormattedDateTime() {
    final DateTime dateTime = DateTime.parse(createdAt).toLocal();

    return formatDate(dateTime, [dd, ' ', MM, ' ', yyyy, ' ', HH, ':', nn, ':', ss]);
  }
}

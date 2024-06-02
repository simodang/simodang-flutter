import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';

@JsonSerializable()
class Device {
  final String id;
  final String name;
  final bool notificationEnabled;
  final bool isSaved;
  final bool isChanged;
  final bool autoWaterEnabled;
  final bool autoFeedEnabled;
  @JsonKey(fromJson: double.parse)
  final double tempLow;
  @JsonKey(fromJson: double.parse)
  final double tempHigh;
  @JsonKey(fromJson: double.parse)
  final double phLow;
  @JsonKey(fromJson: double.parse)
  final double phHigh;
  @JsonKey(fromJson: double.parse)
  final double tdoLow;
  @JsonKey(fromJson: double.parse)
  final double tdoHigh;
  @JsonKey(fromJson: double.parse)
  final double tdsLow;
  @JsonKey(fromJson: double.parse)
  final double tdsHigh;
  @JsonKey(fromJson: double.parse)
  final double turbiditiesLow;
  @JsonKey(fromJson: double.parse)
  final double turbiditiesHigh;
  final String createdAt;

  Device({
    required this.id,
    required this.name,
    required this.notificationEnabled,
    required this.isSaved,
    required this.isChanged,
    required this.autoWaterEnabled,
    required this.autoFeedEnabled,
    required this.tempLow,
    required this.tempHigh,
    required this.phLow,
    required this.phHigh,
    required this.tdoLow,
    required this.tdoHigh,
    required this.tdsLow,
    required this.tdsHigh,
    required this.turbiditiesLow,
    required this.turbiditiesHigh,
    required this.createdAt,
  });

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);
}

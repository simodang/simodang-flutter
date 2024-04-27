import 'package:json_annotation/json_annotation.dart';

part 'pond.g.dart';

@JsonSerializable()
class Pond {
  final String id;
  final String name;
  final String address;
  final String city;
  final String seedDate;
  final int seedCount;
  final String imageUrl;
  final bool status;
  final bool isFilled;
  final String? userId;
  final String? deviceId;

  Pond({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.seedDate,
    required this.seedCount,
    required this.imageUrl,
    required this.status,
    required this.isFilled,
    this.userId,
    this.deviceId,
  });

  factory Pond.fromJson(Map<String, dynamic> json) => _$PondFromJson(json);

  Map<String, dynamic> toJson() => _$PondToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

part 'create_pond.g.dart';

@JsonSerializable()
class CreatePond {
  final String name;
  final String address;
  final String city;
  final bool isFilled;
  String? deviceId;
  final String imageUrl;

  CreatePond({
    required this.name,
    required this.address,
    required this.city,
    required this.isFilled,
    this.deviceId,
    required this.imageUrl,
  });

  Map<String, dynamic> toJson() => _$CreatePondToJson(this);
}

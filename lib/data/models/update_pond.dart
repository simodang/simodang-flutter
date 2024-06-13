import 'package:json_annotation/json_annotation.dart';

part 'update_pond.g.dart';

@JsonSerializable()
class UpdatePond {
  String? name;
  String? address;
  String? city;
  bool? isFilled;
  String? deviceId;
  String? imageUrl;
  String? seedDate;
  int? seedCount;

  UpdatePond({
    this.name,
    this.address,
    this.city,
    this.isFilled,
    this.deviceId,
    this.imageUrl,
    this.seedDate,
    this.seedCount,
  });

  Map<String, dynamic> toJson() => _$UpdatePondToJson(this);
}

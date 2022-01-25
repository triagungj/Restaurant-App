import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/default/entities/entities.dart';

part 'general_model.g.dart';

@JsonSerializable(createToJson: false)
class GeneralModel extends GeneralEntity {
  const GeneralModel({
    required int status,
    required String message,
  }) : super(
          status: status,
          message: message,
        );

  factory GeneralModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralModelFromJson(json);
}

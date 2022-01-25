import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/default/entities/entities.dart';

part 'paginate_model.g.dart';

@JsonSerializable(createToJson: false)
class PaginateModel extends PaginateEntity {
  const PaginateModel({
    required int total,
    required int totalFiltered,
  }) : super(total: total, totalFiltered: totalFiltered);

  factory PaginateModel.fromJson(Map<String, dynamic> json) =>
      _$PaginateModelFromJson(json);
}

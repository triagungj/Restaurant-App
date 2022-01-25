import 'package:json_annotation/json_annotation.dart';

part 'sort_body.g.dart';

@JsonSerializable(createFactory: false)
class SortBody {
  const SortBody({
    required this.orderBy,
    required this.order,
  });

  final String orderBy;
  final String order;

  Map<String, dynamic> toJson() => _$SortBodyToJson(this);
}

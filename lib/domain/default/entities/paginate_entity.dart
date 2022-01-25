import 'package:equatable/equatable.dart';

class PaginateEntity extends Equatable {
  const PaginateEntity({
    required this.total,
    required this.totalFiltered,
  });

  final int total;
  final int totalFiltered;

  @override
  List<Object> get props => [total, totalFiltered];
}

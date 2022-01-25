import 'package:equatable/equatable.dart';

class GeneralEntity extends Equatable {
  const GeneralEntity({
    required this.status,
    required this.message,
  });

  final int status;
  final String message;

  @override
  List<Object> get props => [
        status,
        message,
      ];
}

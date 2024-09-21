import 'package:dozer_mobile/presentation/create_equipment/models/equipment_model.dart';
import 'package:equatable/equatable.dart';

class SearchAssistantResponse extends Equatable {
  final String response;
  final List<Equipment>? equipments;

  SearchAssistantResponse(
      {required this.response, this.equipments});

  @override
  // TODO: implement props
  List<Object?> get props => [response, equipments];
}

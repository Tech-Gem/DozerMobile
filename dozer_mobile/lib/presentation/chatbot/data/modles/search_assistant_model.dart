import 'package:dozer_mobile/presentation/chatbot/domain/entities/search_assistant_response.dart';
import 'package:dozer_mobile/presentation/create_equipment/models/equipment_model.dart';

class SearchAssistantResponseModel extends SearchAssistantResponse {
  SearchAssistantResponseModel({
    required String response,
    List<Equipment>? equipments,
  }) : super(
          response: response,
          equipments: equipments,
        );

  factory SearchAssistantResponseModel.fromJson(Map<String, dynamic> json) {
    final equp = json['equipments'];
    final List<Equipment> equipments = [];
    if (equp != null) {
      for (var i = 0; i < equp.length; i++) {
        final equipment = Equipment.fromJson(equp[i]);
        equipments.add(equipment);
      }
    }
    return SearchAssistantResponseModel(
      response: json['response'] ?? "",
      equipments: equipments,
    );
  }
}

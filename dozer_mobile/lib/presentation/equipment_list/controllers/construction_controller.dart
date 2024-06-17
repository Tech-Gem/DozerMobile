import 'package:dozer_mobile/presentation/equipment_list/models/construction_machine.dart';
import 'package:dozer_mobile/presentation/equipment_list/repository/construction_repository.dart';
import 'package:get/get.dart';


class ConstructionMachineController extends GetxController {
  final ConstructionMachineRepository _repository = ConstructionMachineRepository();
  RxList<ConstructionMachineModel> recommendedList = <ConstructionMachineModel>[].obs;
  RxList<ConstructionMachineModel> allList = <ConstructionMachineModel>[].obs;

  RxList<ConstructionMachineModel> categoryList = <ConstructionMachineModel>[].obs;
  Rx<Status> status = Status.loading.obs; // Add status
  Rx<Status> statusCategory = Status.loading.obs;
  RxString selectedCategory = 'CompactEquipment'.obs;


  // Add variables for search text and filters
  RxString searchText = ''.obs;
  RxList<String> selectedFilters = <String>[].obs;
  RxList<String> categoryOptions = [
    "CompactEquipment",
    "HeavyEarthmoving",
    "LiftAerialWorkPlatform",
    "RollersCompaction"
  ].obs;
  RxList<String> locationOptions = [
    "Addis Ketema",
    "Akaky Kaliti",
    "Arada",
    "Bole",
    "Gullele",
    "Kirkos",
    "Kolfe Keranio",
    "Lideta",
    "Lemi Kura",
    "Nifas Silk-Lafto",
    "Yeka"
  ].obs;


  @override
  void onInit() {
    super.onInit();
    loadRecommendedMachines();
    loadRecommendedMachinesbyCategory(selectedCategory.value);
  }
 // Function to set search text
  void setSearchText(String text) {
    searchText.value = text;
  }

  // Function to toggle filter
  void toggleFilter(String filter) {
    if (selectedFilters.contains(filter)) {
      selectedFilters.remove(filter);
    } else {
      selectedFilters.add(filter);
    }
  }

  // Function to clear all filters
  void clearFilters() {
    searchText.value = '';
    selectedFilters.clear();
  }

  // Function to filter machines based on search text and filters
  List<ConstructionMachineModel> filterMachines() {
        status(Status.loading); // Set loading status
    final filteredList = allList.where((machine) {
      final name = machine.name.toLowerCase();
      final search = searchText.value.toLowerCase();
      final nameMatch = name.contains(search);
      final categoryMatch =
          selectedFilters.isEmpty || selectedFilters.any((filter) => machine.category.contains(filter));

      return nameMatch && categoryMatch;
    }).toList();
    allList.assignAll(filteredList);
  status(Status.success); // Set success status
    return filteredList;
  }

  void loadRecommendedMachines() async {
  try {
    status(Status.loading); // Set loading status
    final machines = await _repository.getRecommendedMachines();
    print('machines: $machines');

    if (machines.isNotEmpty) {
      allList.assignAll(machines);
      status(Status.success); // Set success status
    } else {
      status(Status.error); // Set error status
      print('Error loading recommended machines: Empty response');
    }
  } catch (e) {
    status(Status.error); // Set error status
    print('Error loading recommended machines: $e');
  }
}
void loadRecommendedMachinesbyCategory(String category) async {
  try {
    statusCategory(Status.loading); // Set loading status
    final machines = await _repository.getMachinesByCategory(category);

    if (machines.isNotEmpty) {
      recommendedList.assignAll(machines);
      status(Status.success); // Set success status
    } else {
      statusCategory(Status.error); // Set error status
      print('Error loading recommended machines: Empty response');
    }
  } catch (e) {
    statusCategory(Status.error); // Set error status
    print('Error loading recommended machines: $e');
  }
}

}

enum Status { loading, success, error }

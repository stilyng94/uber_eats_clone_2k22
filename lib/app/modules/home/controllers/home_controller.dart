import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';

import '../places_prediction_model.dart';
import '../providers/places_prediction_provider.dart';

class HomeController extends GetxController {
  final activeButton = HeaderButtonType.delivery.obs;
  final RxList<PlacesResults> autoFillHints = RxList<PlacesResults>();
  final searchValue = "".obs;
  final bottomNavigationIndex = 0.obs;

  late Worker searchWorker;
  late GooglePlace googlePlace;
  final searchController = TextEditingController();

  final PlacesPredictionProvider _placesPredictionProvider =
      PlacesPredictionProvider();

  @override
  void onInit() {
    String apiKey = dotenv.env['GEOAPIFY_API_KEY'] ?? "";
    //TODO: Handle when API kEY is Null
    googlePlace = GooglePlace(apiKey);

    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    searchWorker.dispose();
    super.onClose();
  }

  void onHeaderButtonHandler(HeaderButtonType headerButtonType) {
    activeButton.value = headerButtonType;
    return;
  }

  Future<void> onSearchChange(String newTerm) async {
    searchValue.value = newTerm;
    await handleGeoapifyPlacesSearch();
  }

  Future<void> handleGeoapifyPlacesSearch() async {
    var result = await _placesPredictionProvider.getPlacesPrediction(
        searchValue.value, "4.9146637,-1.8125303");

    if (result != null && result.results != null) {
      autoFillHints.value = result?.results ?? [];
    }
  }
}

typedef HeaderButtonCallback = void Function(HeaderButtonType headerButtonType);
enum HeaderButtonType { delivery, pickup }

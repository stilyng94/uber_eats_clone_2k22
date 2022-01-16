import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';

import '../../restaurant/controllers/restaurant_controller.dart';
import '../controllers/home_controller.dart';
import '../places_prediction_model.dart';

class Search extends GetView<HomeController> {
  Search({Key? key}) : super(key: key);
  final RestaurantController restaurantController =
      Get.find<RestaurantController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TypeAheadField<PlacesResults>(
              hideSuggestionsOnKeyboardHide: false,
              textFieldConfiguration: TextFieldConfiguration(
                  style: DefaultTextStyle.of(context).style.copyWith(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      backgroundColor: const Color(0x000ffeee)),
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      labelText: 'Search',
                      suffix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.timelapse_sharp,
                            size: 12,
                          ),
                          Text("Search")
                        ],
                      ),
                      prefixIcon: const Icon(Icons.pin_drop_sharp))),
              suggestionsCallback: (pattern) async {
                await controller.onSearchChange(pattern);
                return controller.autoFillHints;
              },
              debounceDuration: const Duration(milliseconds: 1000),
              itemBuilder: (context, suggestion) {
                return ListTile(
                  leading: const Icon(Icons.restaurant_rounded),
                  title: Text(suggestion.name ?? ""),
                  subtitle: Text(suggestion?.categories?[0]?.name ?? ""),
                );
              },
              onSuggestionSelected: (suggestion) {
                //TODO: Handle when a place is selected. Query by id and use Yelp
                restaurantController.locationName.value = suggestion.fsqId!;
              },
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: Fix null

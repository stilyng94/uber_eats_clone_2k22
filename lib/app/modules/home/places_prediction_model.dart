class PlacesPrediction {
  List<PlacesResults>? results;

  PlacesPrediction({this.results});

  PlacesPrediction.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <PlacesResults>[];
      json['results'].forEach((v) {
        results?.add(PlacesResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PlacesResults {
  String? fsqId;
  List<Categories>? categories;
  String? name;

  PlacesResults({this.fsqId, this.categories, this.name});

  PlacesResults.fromJson(Map<String, dynamic> json) {
    fsqId = json['fsq_id'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fsq_id'] = fsqId;
    if (categories != null) {
      data['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  PlaceIcon? icon;

  Categories({this.id, this.name, this.icon});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    icon = json['icon'] != null ? PlaceIcon?.fromJson(json['icon']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (icon != null) {
      data['icon'] = icon?.toJson();
    }
    return data;
  }
}

class PlaceIcon {
  String? prefix;
  String? suffix;

  PlaceIcon({this.prefix, this.suffix});

  PlaceIcon.fromJson(Map<String, dynamic> json) {
    prefix = json['prefix'];
    suffix = json['suffix'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['prefix'] = prefix;
    data['suffix'] = suffix;
    return data;
  }
}

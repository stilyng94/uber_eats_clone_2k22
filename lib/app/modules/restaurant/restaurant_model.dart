class RestaurantModel {
  List<Business>? businesses;
  int? total;

  RestaurantModel({this.businesses, this.total});

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    if (json['businesses'] != null) {
      businesses = <Business>[];
      json['businesses'].forEach((v) {
        businesses?.add(Business.fromJson(v));
      });
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (businesses != null) {
      data['businesses'] = businesses?.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class Business {
  String? id;
  String? name;
  String? imageUrl;
  bool? isClosed;
  String? url;
  int? reviewCount;
  List<Categories>? categories;
  double? rating;
  List<String>? transactions;
  String? price;
  Location? location;
  String? phone;
  String? displayPhone;

  Business(
      {this.id,
      this.name,
      this.imageUrl,
      this.isClosed,
      this.url,
      this.reviewCount,
      this.categories,
      this.rating,
      this.transactions,
      this.price,
      this.location,
      this.phone,
      this.displayPhone});

  Business.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    imageUrl = json['image_url'];
    isClosed = json['is_closed'];
    url = json['url'];
    reviewCount = json['review_count'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories?.add(Categories.fromJson(v));
      });
    }
    rating = json['rating'];
    transactions = json['transactions'].cast<String>();
    price = json['price'];
    location =
        json['location'] != null ? Location?.fromJson(json['location']) : null;
    phone = json['phone'];
    displayPhone = json['display_phone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image_url'] = imageUrl;
    data['is_closed'] = isClosed;
    data['url'] = url;
    data['review_count'] = reviewCount;
    if (categories != null) {
      data['categories'] = categories?.map((v) => v.toJson()).toList();
    }
    data['rating'] = rating;
    data['transactions'] = transactions;
    data['price'] = price;
    if (location != null) {
      data['location'] = location?.toJson();
    }
    data['phone'] = phone;
    data['display_phone'] = displayPhone;
    return data;
  }
}

class Categories {
  String? title;

  Categories({this.title});

  Categories.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    return data;
  }
}

class Location {
  String? address1;
  String? city;
  String? zipCode;
  String? country;
  String? state;
  List<String>? displayAddress;

  Location(
      {this.address1,
      this.city,
      this.zipCode,
      this.country,
      this.state,
      this.displayAddress});

  Location.fromJson(Map<String, dynamic> json) {
    address1 = json['address1'];
    city = json['city'];
    zipCode = json['zip_code'];
    country = json['country'];
    state = json['state'];
    displayAddress = json['display_address'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['address1'] = address1;
    data['city'] = city;
    data['zip_code'] = zipCode;
    data['country'] = country;
    data['state'] = state;
    data['display_address'] = displayAddress;
    return data;
  }
}

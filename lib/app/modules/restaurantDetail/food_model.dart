class FoodModel {
  final String id;
  final double price;
  final String title;
  final String? imageUrl;
  final String? description;

  FoodModel(
      {required this.id,
      required this.price,
      required this.title,
      this.imageUrl,
      this.description});
}

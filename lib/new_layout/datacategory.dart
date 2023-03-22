

class Data {
  static List<ProductModel> generateProducts(){
    return [
      ProductModel(
        1,
        "assets/img/watch1.jpg",
        "Bamford Watch Department Rolex",
        "watch",
        // 99.56
      ),
      ProductModel(
        2,
        "assets/img/watch1.jpg",
        "Round Pointer Quartz Watch",
        "watch",
      ),
      ProductModel(
        3,
        "assets/img/watch1.jpg",
        "Digital Smart Watch",
        "watch",
      ),
      ProductModel(
        4,
        "assets/img/watch1.jpg",
        "Kid's Playzoom 2 Pink Unicorn",
        "watch",
      ),
    ];
  }

  static List<ProductModel> generateCategories(){
    return [
      ProductModel(
        1,
        "assets/img/watch1.jpg",
        "All",
        "watch",
      ),
      ProductModel(
        2,
        "assets/img/watch1.jpg",
        "women",
        "watch",

      ),
      ProductModel(
        3,
        "assets/img/watch1.jpg",
        "man",
        "watch",
      ),
      ProductModel(
        4,
        "assets/img/watch1.jpg",
        "kids",
        "watch",
      ),
    ];
  }
}
class ProductModel {
  int id;
  String image;
  String title;
  String type;

  ProductModel(this.id,this.image,this.title,this.type);
}
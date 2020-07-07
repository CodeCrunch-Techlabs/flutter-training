class Food {
  final String name;
  final double price;
  final String item;
  final String imgPath;
  final String size;

  Food({this.name, this.price, this.item, this.size, this.imgPath});

  static List<Food> list = [
    Food(
      name: "Maxico",
      price: 120,
      item: "Mixed Pizza",
      imgPath: "1.png",
      size: "Small size 6 inch",
    ),
    Food(
      name: "Italian",
      price: 100,
      size: "Mediam size 9 inch",
      item: "Mixed pizza with cheese",
      imgPath: "2.png",
    ),
    Food(
      name: "Neapolitan pizza",
      price: 90,
      size: "Mediam size 10 inch",
      item: "Panzerotti",
      imgPath: "3.png",
    ),
    Food(
      name: "Margherita Pizza",
      price: 50,
      size: "Large size 12 inch",
      item: "Double Cheese",
      imgPath: "4.png",
    ),
    Food(
      name: "Sicilian Pizza",
      price: 20,
      size: "Large size 12 inch",
      item: "Deluxe Veggie",
      imgPath: "5.png",
    ),
  ];
}

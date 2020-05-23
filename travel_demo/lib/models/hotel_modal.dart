class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.address,
    this.imageUrl,
    this.name,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/ht1.jpg',
    address: '101 Main st',
    name: 'Hotel 0',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/ht2.jpg',
    address: '102 Main st',
    name: 'Hotel 2',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/ht3.jpg',
    address: '103 Main st',
    name: 'Hotel 3',
    price: 175,
  ),
  Hotel(
    imageUrl: 'assets/images/ht4.jpg',
    address: '104 Main st',
    name: 'Hotel 4',
    price: 175,
  ),
];

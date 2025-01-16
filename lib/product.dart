class Product{
  int id;
  String name;
  String storeName;
  bool state;
  Product? alternative;

  Product({
    required this.id,
    required this.name,
    required this.storeName,
    required this.state,
    this.alternative
  });
}
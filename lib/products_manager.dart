import 'package:se_app/product.dart';

class ProductsManager{
  static List<Product> products = <Product>[
    Product(
      id: 1,
      name: "iPhone 14 Pro Max",
      storeName: "Apple",
      state: false,
      alternative: Product(
        id: 4,
        name: "iPhone 14 Pro",
        storeName: "Apple",
        state: true,
      )
    ),

    Product(
        id: 2,
        name: "Xiaomi 12 pro 4G",
        storeName: "Xiaomi",
        state: false,
      alternative: Product(
        id: 5,
        name: "Xiaomi 11 pro 4G",
        storeName: "Xiaomi",
        state: true,
      )
    ),

    Product(
        id: 3,
        name: "S24 Ultra",
        storeName: "Samsung",
        state: true
    ),

  ];

  static bool orderProduct(int id, {bool? alternative}){
    //Get the product
    Product pro = products.firstWhere((element) => element.id == id);
    if(alternative != null && alternative){
      return pro.alternative!.state;
    }
    //Return the status of the product
    return pro.state;
  }

  static List<Product> getProducts(){
    //Returns the list of the products
    return products;
  }

}
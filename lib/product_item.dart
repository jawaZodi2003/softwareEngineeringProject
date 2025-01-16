import 'package:flutter/material.dart';
import 'package:se_app/product.dart';
import 'package:se_app/products_manager.dart';

class ProductItem extends StatelessWidget {

  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 1),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            product.name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            children: [
              Icon(Icons.store, color: Colors.blueGrey[700]),
              const SizedBox(width: 4,),
              Text(
                product.storeName,
                style: TextStyle(
                  color: Colors.blueGrey[900],
                ),
              ),
            ],
          ),
          const SizedBox(height: 3,),
          Row(
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: product.state? Colors.green : Colors.red,
                  shape: BoxShape.circle
                ),
              ),
              const SizedBox(width: 4,),
              Text(
                product.state? "Available" : "Not Available",
                style: TextStyle(
                  color: product.state? Colors.green : Colors.red
                ),
              )
            ],
          ),
          const SizedBox(height: 16,),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              ElevatedButton(
                  onPressed: (){
                    bool order = ProductsManager.orderProduct(product.id);
                    if(order){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Product: ${product.name} has been ordered successfully')));
                    }else{
                      Product alternativeProduct = product.alternative!;
                      bool orderAlternative = ProductsManager.orderProduct(product.id, alternative: true);
                      if(orderAlternative){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Alternative Product: ${alternativeProduct.name} has been ordered successfully')));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Failed to order the product')));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey
                  ),
                  child: Text(
                    product.state? "Order the product" : "Order the alternative product",
                    style: const TextStyle(
                      color: Colors.white
                    ),
                  ),
              )
            ],
          )
        ],
      ),
    );
  }
}

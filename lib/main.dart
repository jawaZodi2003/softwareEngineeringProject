import 'package:flutter/material.dart';
import 'package:se_app/product.dart';
import 'package:se_app/product_item.dart';
import 'package:se_app/products_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Product> products = <Product>[];

  @override
  void initState() {
    super.initState();
    _getProduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Software Engineering Homework", style: TextStyle(color: Colors.white),),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              itemCount: products.length,
              itemBuilder: (context, index){
                return ProductItem(product: products[index]);
              },
            ),
          ),
          Divider(),
          const SizedBox(height: 8,),
          Text(
            "Developed by:\nJawa Zodi - Jessy Hneno - Arin Kouti",
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16,),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _getProduct(){
    setState(() {
      products = ProductsManager.getProducts();
    });
  }
}

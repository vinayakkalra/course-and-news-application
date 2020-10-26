import 'package:course_and_news/model/product.dart';
import 'package:flutter/cupertino.dart';


class MyStore with ChangeNotifier{

  List<Product> _products = [];
  List<Product> _baskets = [];
  List<Product> _events = [];
  Product _activeProduct = null;

  MyStore(){
    _products = [
      Product(id: 1, name: "CryptoCurrency1", price: 1000, image:"https://media.comicbook.com/2020/04/boruto-better-worse-naruto-shippuden-anime-manga-1214901.jpeg?auto=webp&width=800&height=483&crop=800:483,smart"),
      Product(id: 2, name: "CryptoCurrency2", price: 1000, image:"https://media.comicbook.com/2020/04/boruto-better-worse-naruto-shippuden-anime-manga-1214901.jpeg?auto=webp&width=800&height=483&crop=800:483,smart"),
      Product(id: 3, name: "CryptoCurrency3", price: 1000, image:"https://media.comicbook.com/2020/04/boruto-better-worse-naruto-shippuden-anime-manga-1214901.jpeg?auto=webp&width=800&height=483&crop=800:483,smart"),
      Product(id: 4, name: "CryptoCurrency4", price: 1000, image:"https://media.comicbook.com/2020/04/boruto-better-worse-naruto-shippuden-anime-manga-1214901.jpeg?auto=webp&width=800&height=483&crop=800:483,smart"),
      Product(id: 5, name: "CryptoCurrency5", price: 1000, image:"https://media.comicbook.com/2020/04/boruto-better-worse-naruto-shippuden-anime-manga-1214901.jpeg?auto=webp&width=800&height=483&crop=800:483,smart"),
    ];

  // send notification to the provider
  notifyListeners();
  }

  // In order to access the global variables(_products, _baskets, _activeProduct) in UI
  // We created getters
  List<Product> get products => _products;
  List<Product> get baskets => _baskets;
  List<Product> get events => _events;
  Product get activeProduct => _activeProduct;

  setAtiveProduct(Product product){
    _activeProduct = product;
    notifyListeners();
  }

  addProduct(Product product){

    Product found = _baskets.firstWhere((a) => a.id == product.id, orElse: () => null);

    if (found == null){
      _baskets.add(product);
    }
    notifyListeners();
  }

  removeProduct(Product product){

    Product found = _baskets.firstWhere((a) => a.id == product.id, orElse: () => null);

    if (found != null){
      _baskets.remove(product);
    }
    notifyListeners();
  } 



}